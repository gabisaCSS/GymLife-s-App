import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';

part 'calorie_progress_counter_state.dart';

class CalorieProgressCounterCubit extends Cubit<CalorieProgressCounterState> {
  CalorieProgressCounterCubit() : super(CalorieProgressCounterInitial());

  void getTodayFood() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    List<FoodModel> foods =
        await dbHelper.getFoods(date: DateTime.now(), eatTime: '');

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

    emit(CalorieProgressCounterValueState(
        totalCalories: totalCalorie,
        totalProtein: totalProtein,
        totalCarbs: totalCarbs,
        totalFiber: totalFiber,
        totalFat: totalFat,
        totalSugar: totalSugar));
  }
}
