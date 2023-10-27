import 'package:gym_lifes_app/model/food_model/food_model.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
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

  final String _tableName1 = 'tb_food';
  final String _tableName2 = 'tb_nutrition';

  Future<Database> _initializeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'contact_db.db'),
        onCreate: (db, version) async {
      await db.execute('''CREATE TABLE $_tableName1(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          food_name TEXT,
          date TEXT,
          eat_time Text
        )''');
      await db.execute('''CREATE TABLE $_tableName2(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          food_id INTEGER,
          label TEXT,
          quantity REAL,
          unit TEXT
        )''');
    }, version: 1);
    return db;
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
    final foodId = await db.insert(_tableName1, {...foodModel.toMap()});

    for (NutrientsData nutrition in nutritionList) {
      await db.insert(_tableName2, {'food_id': foodId, ...nutrition.toMap()});
    }
  }

  // Future<List<FoodModel>> getFoods() async {
  //   final Database db = await database;

  //   // Lakukan kueri SQL untuk mengambil data makanan dan nutrisi yang sesuai
  //   final List<Map<String, dynamic>> foodMapList = await db.query(_foodTable);
  //   final List<Map<String, dynamic>> nutritionMapList =
  //       await db.query(_tableName2);

  //   // Buat daftar makanan (FoodModel) untuk menampung hasil kueri
  //   List<FoodModel> foodList = [];

  //   // Iterasi melalui hasil kueri data makanan
  //   for (var foodMap in foodMapList) {
  //     final int foodId = foodMap['id'];
  //     final List<NutrientsData> nutritionList = [];

  //     // Iterasi melalui hasil kueri nutrisi yang sesuai dengan makanan
  //     for (var nutritionMap in nutritionMapList) {
  //       if (nutritionMap['id'] == foodId) {
  //         final NutrientsData nutritionData = NutrientsData(
  //           label: nutritionMap['label'],
  //           quantity: double.parse(nutritionMap['quantity']),
  //           unit: nutritionMap['unit'],
  //         );
  //         nutritionList.add(nutritionData);
  //       }
  //     }

  //     // Buat objek FoodModel dan tambahkan ke daftar foodList
  //     final FoodModel foodModel = FoodModel(
  //       foodId: foodId,
  //       foodName: foodMap[_foodNameColumn],
  //       date: DateTime.parse(foodMap[_dateColumn]),
  //       eatTime: foodMap[_eatTimeColumn],
  //       calori: nutritionList.firstWhere((n) => n.label == "Energy",
  //           orElse: () =>
  //               NutrientsData(label: "Energy", quantity: 0, unit: "kcal")),
  //       carbs: nutritionList.firstWhere(
  //           (n) => n.label == "Carbohydrate, by difference",
  //           orElse: () => NutrientsData(
  //               label: "Carbohydrate, by difference", quantity: 0, unit: "g")),
  //       protein: nutritionList.firstWhere((n) => n.label == "Protein",
  //           orElse: () =>
  //               NutrientsData(label: "Protein", quantity: 0, unit: "g")),
  //       fat: nutritionList.firstWhere((n) => n.label == "Total lipid (fat)",
  //           orElse: () => NutrientsData(
  //               label: "Total lipid (fat)", quantity: 0, unit: "g")),
  //       fiber: nutritionList.firstWhere(
  //           (n) => n.label == "Fiber, total dietary",
  //           orElse: () => NutrientsData(
  //               label: "Fiber, total dietary", quantity: 0, unit: "g")),
  //       sugar: nutritionList.firstWhere(
  //           (n) => n.label == "Sugars, total including NLEA",
  //           orElse: () => NutrientsData(
  //               label: "Sugars, total including NLEA", quantity: 0, unit: "g")),
  //     );

  //     foodList.add(foodModel);
  //   }

  //   return foodList;
  // }

  // Future<void> insertContact(ContactModel contactModel) async {
  //   final Database db = await database;
  //   await db.insert(_tableName, contactModel.toMap());
  // }

  // Future<List<ContactModel>> getContacts() async {
  //   final Database db = await database;
  //   List<Map<String, dynamic>> results = await db.query(_tableName);
  //   return results.map((e) => ContactModel.fromMap(e)).toList();
  // }

  // Future<void> updateContact(ContactModel contactModel) async {
  //   final db = await database;
  //   await db.update(_tableName, contactModel.toMap(),
  //       where: 'id = ?', whereArgs: [contactModel.id]);
  // }

  // Future<void> deleteContact(int id) async {
  //   final db = await database;
  //   await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  // }
}
