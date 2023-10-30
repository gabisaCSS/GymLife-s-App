import 'package:gym_lifes_app/model/food_model/food_model.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _foodTable = 'tb_food';
  static const String _foodIdColumn = 'food_id';
  static const String _foodNameColumn = 'food_name';
  static const String _dateColumn = 'date';
  static const String _eatTimeColumn = 'eat_time';

  static const String _nutritionTable = 'tb_nutrition';
  static const String _nutritionIdColumn = 'nutrition_id';
  static const String _labelColumn = 'label';
  static const String _quantityColumn = 'quantity';
  static const String _unitColumn = 'unit';

  static const String _weightTable = 'tb_weight';
  static const String _weightIdColumn = 'id';
  static const String _weightColumn = 'weight';
  static const String _weightDateColumn = 'date';

  Future<Database> _initializeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'gym_db.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $_foodTable(
          $_foodIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $_foodNameColumn TEXT,
          $_dateColumn TEXT,
          $_eatTimeColumn TEXT
        )''');

      await db.execute('''
          CREATE TABLE $_nutritionTable(
          $_nutritionIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $_foodIdColumn INTEGER,
          $_labelColumn TEXT,
          $_quantityColumn TEXT,
          $_unitColumn TEXT
        )
        ''');

      await db.execute('''
          CREATE TABLE $_weightTable(
          $_weightIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $_weightColumn REAL,
          $_weightDateColumn INT
        )
        ''');
    }, version: 1);
    return db;
  }

  Future<void> insertWeight(WeightModel weightModel) async {
    final Database db = await database;
    await db.insert(_weightTable, weightModel.toMap());
  }

  Future<List<WeightModel>> getWeight({DateTime? sinceDate}) async {
    final Database db = await database;

    if (sinceDate == null) {
      final List<Map<String, dynamic>> result =
          await db.query(_weightTable, orderBy: _weightDateColumn);

      final List<WeightModel> weightModelList = result.map((e) {
        // print(e['date']);
        return WeightModel.fromMap(e);
      }).toList();
      return weightModelList;
    } else {
      int dateInt = sinceDate.millisecondsSinceEpoch;
      final List<Map<String, dynamic>> result = await db.query(_weightTable,
          orderBy: _weightDateColumn,
          where: "$_weightDateColumn >= ?",
          whereArgs: [dateInt]);

      final List<WeightModel> weightModelList =
          result.map((e) => WeightModel.fromMap(e)).toList();
      return weightModelList;
    }
  }

  Future<void> insertFood(FoodModel foodModel) async {
    List<NutrientsData> nutritionList = [
      foodModel.calori,
      foodModel.carbs,
      foodModel.fat,
      foodModel.fiber,
      foodModel.protein,
      foodModel.sugar
    ];
    final Database db = await database;
    final foodId = await db.insert(_foodTable, foodModel.toMap());

    for (NutrientsData nutrition in nutritionList) {
      await db.insert(
          _nutritionTable, {_foodIdColumn: foodId, ...nutrition.toMap()});
    }
  }

  Future<List<FoodModel>> getFoods(
      {required DateTime date, required String eatTime}) async {
    final Database db = await database;

    // Lakukan kueri SQL untuk mengambil data makanan dan nutrisi yang sesuai
    final List<Map<String, dynamic>> foodMapList = await db.query(_foodTable,
        // );
        where: '$_dateColumn = ? and $_eatTimeColumn = ?',
        whereArgs: [DateFormat('yyyy-MM-dd').format(date), eatTime]);
    final List<Map<String, dynamic>> nutritionMapList = await db.query(
      _nutritionTable,
    );

    // Buat daftar makanan (FoodModel) untuk menampung hasil kueri
    List<FoodModel> foodList = [];

    // Iterasi melalui hasil kueri data makanan
    for (var foodMap in foodMapList) {
      final int foodId = foodMap[_foodIdColumn];
      final List<NutrientsData> nutritionList = [];

      // Iterasi melalui hasil kueri nutrisi yang sesuai dengan makanan
      for (var nutritionMap in nutritionMapList) {
        if (nutritionMap[_foodIdColumn] == foodId) {
          final NutrientsData nutritionData = NutrientsData(
            label: nutritionMap[_labelColumn],
            quantity: double.parse(nutritionMap[_quantityColumn]),
            unit: nutritionMap[_unitColumn],
          );
          nutritionList.add(nutritionData);
        }
      }

      // Buat objek FoodModel dan tambahkan ke daftar foodList
      final FoodModel foodModel = FoodModel(
        foodId: foodId,
        foodName: foodMap[_foodNameColumn],
        date: DateTime.parse(foodMap[_dateColumn]),
        eatTime: foodMap[_eatTimeColumn],
        calori: nutritionList.firstWhere((n) => n.label == "Energy",
            orElse: () =>
                NutrientsData(label: "Energy", quantity: 0, unit: "kcal")),
        carbs: nutritionList.firstWhere(
            (n) => n.label == "Carbohydrate, by difference",
            orElse: () => NutrientsData(
                label: "Carbohydrate, by difference", quantity: 0, unit: "g")),
        protein: nutritionList.firstWhere((n) => n.label == "Protein",
            orElse: () =>
                NutrientsData(label: "Protein", quantity: 0, unit: "g")),
        fat: nutritionList.firstWhere((n) => n.label == "Total lipid (fat)",
            orElse: () => NutrientsData(
                label: "Total lipid (fat)", quantity: 0, unit: "g")),
        fiber: nutritionList.firstWhere(
            (n) => n.label == "Fiber, total dietary",
            orElse: () => NutrientsData(
                label: "Fiber, total dietary", quantity: 0, unit: "g")),
        sugar: nutritionList.firstWhere(
            (n) => n.label == "Sugars, total including NLEA",
            orElse: () => NutrientsData(
                label: "Sugars, total including NLEA", quantity: 0, unit: "g")),
      );

      foodList.add(foodModel);
    }
    return foodList;
  }
}
