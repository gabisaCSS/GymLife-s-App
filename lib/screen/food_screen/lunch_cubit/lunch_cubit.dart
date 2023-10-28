import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';

part 'lunch_state.dart';

class LunchCubit extends Cubit<LunchValueState> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  LunchCubit() : super(LunchInitial());

  void getLunch({required DateTime date}) async {
    List<FoodModel> foods =
        await dbHelper.getFoods(date: date, eatTime: 'Lunch');
    if (foods.isEmpty) {
      emit(LunchInitial());
    } else {
      double totalCalorie = 0;
      double totalProtein = 0;
      double totalCarbs = 0;
      double totalFiber = 0;
      double totalFat = 0;
      double totalSugar = 0;

      for (var food in foods) {
        totalCalorie += food.calori.quantity;
        totalCarbs += food.carbs.quantity;
        totalProtein += food.protein.quantity;
        totalFat += food.fat.quantity;
        totalFiber += food.fiber.quantity;
        totalSugar += food.sugar.quantity;
      }

      emit(LunchValueState(
          lunchList: foods,
          totalCalories: totalCalorie,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFiber: totalFiber,
          totalFat: totalFat,
          totalSugar: totalSugar));
    }
  }

  void addLunch({required FoodModel food}) async {
    double totalCalorie = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFiber = 0;
    double totalFat = 0;
    double totalSugar = 0;
    List<FoodModel> foods = [];

    foods = List.from(state.lunchList);
    foods.add(food);

    await dbHelper.insertFood(food);

    for (var food in foods) {
      totalCalorie += food.calori.quantity;
      totalCarbs += food.carbs.quantity;
      totalProtein += food.protein.quantity;
      totalFat += food.fat.quantity;
      totalFiber += food.fiber.quantity;
      totalSugar += food.sugar.quantity;
    }

    emit(LunchValueState(
        lunchList: foods,
        totalCalories: totalCalorie,
        totalProtein: totalProtein,
        totalCarbs: totalCarbs,
        totalFiber: totalFiber,
        totalFat: totalFat,
        totalSugar: totalSugar));
  }
}
