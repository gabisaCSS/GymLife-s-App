import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';

class FoodModel {
  final String foodName;
  final NutrientsData calori;
  final NutrientsData carbs;
  final NutrientsData protein;
  final NutrientsData fat;
  final NutrientsData fiber;
  final NutrientsData sugar;

  const FoodModel(
      {required this.foodName,
      required this.calori,
      required this.carbs,
      required this.protein,
      required this.fat,
      required this.fiber,
      required this.sugar});
}
