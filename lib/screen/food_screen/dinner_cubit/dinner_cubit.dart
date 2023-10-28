import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';

part 'dinner_state.dart';

class DinnerCubit extends Cubit<DinnerValueState> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  DinnerCubit() : super(DinnerInitial());

  void getDinner({required DateTime date}) async {
    List<FoodModel> foods =
        await dbHelper.getFoods(date: date, eatTime: 'Dinner');
    if (foods.isEmpty) {
      emit(DinnerInitial());
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

      emit(DinnerValueState(
          dinnerList: foods,
          totalCalories: totalCalorie,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFiber: totalFiber,
          totalFat: totalFat,
          totalSugar: totalSugar));
    }
  }

  void addDinner({required FoodModel food}) async {
    double totalCalorie = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFiber = 0;
    double totalFat = 0;
    double totalSugar = 0;
    List<FoodModel> foods = [];

    foods = List.from(state.dinnerList);
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

    emit(DinnerValueState(
        dinnerList: foods,
        totalCalories: totalCalorie,
        totalProtein: totalProtein,
        totalCarbs: totalCarbs,
        totalFiber: totalFiber,
        totalFat: totalFat,
        totalSugar: totalSugar));
  }
}
