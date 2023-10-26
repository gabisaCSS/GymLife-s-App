import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';

part 'dinner_state.dart';

class DinnerCubit extends Cubit<DinnerValueState> {
  DinnerCubit() : super(DinnerInitial());

  void addDinner({required FoodModel food}) {
    double totalCalorie = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFiber = 0;
    double totalFat = 0;
    double totalSugar = 0;
    List<FoodModel> foods = [];

    foods = List.from(state.dinnerList);
    foods.add(food);

    for (var element in foods) {
      totalCalorie += element.calori.quantity;
    }
    for (var element in foods) {
      totalProtein += element.protein.quantity;
    }
    for (var element in foods) {
      totalFat += element.fat.quantity;
    }
    for (var element in foods) {
      totalFiber += element.fiber.quantity;
    }
    for (var element in foods) {
      totalSugar += element.sugar.quantity;
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
