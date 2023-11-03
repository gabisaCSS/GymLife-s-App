import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';

part 'breakfast_state.dart';

class BreakfastCubit extends Cubit<BreakfastValueState> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  BreakfastCubit() : super(BreakfastInitial());

  void getBreakfast({required DateTime date}) async {
    List<FoodModel> foods =
        await dbHelper.getFoods(date: date, eatTime: 'Breakfast');
    if (foods.isEmpty) {
      emit(BreakfastInitial());
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

      emit(BreakfastValueState(
          breakfastList: foods,
          totalCalories: totalCalorie,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFiber: totalFiber,
          totalFat: totalFat,
          totalSugar: totalSugar));
    }
  }

  void addBreakfast({required FoodModel food}) async {
    double totalCalorie = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFiber = 0;
    double totalFat = 0;
    double totalSugar = 0;

    await dbHelper.insertFood(food);

    List<FoodModel> foods =
        await dbHelper.getFoods(date: food.date, eatTime: food.eatTime);

    for (var food in foods) {
      totalCalorie += food.calori.quantity;
      totalCarbs += food.carbs.quantity;
      totalProtein += food.protein.quantity;
      totalFat += food.fat.quantity;
      totalFiber += food.fiber.quantity;
      totalSugar += food.sugar.quantity;
    }

    emit(BreakfastValueState(
        breakfastList: foods,
        totalCalories: totalCalorie,
        totalProtein: totalProtein,
        totalCarbs: totalCarbs,
        totalFiber: totalFiber,
        totalFat: totalFat,
        totalSugar: totalSugar));
  }
}
