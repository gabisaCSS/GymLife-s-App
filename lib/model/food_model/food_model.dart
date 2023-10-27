import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
import 'package:intl/intl.dart';

class FoodModel {
  final int? foodId;
  final String foodName;
  final DateTime date;
  final String eatTime; // breakfast, lunch, dinner etc
  final NutrientsData calori;
  final NutrientsData carbs;
  final NutrientsData protein;
  final NutrientsData fat;
  final NutrientsData fiber;
  final NutrientsData sugar;

  const FoodModel(
      {this.foodId,
      required this.foodName,
      required this.date,
      required this.eatTime,
      required this.calori,
      required this.carbs,
      required this.protein,
      required this.fat,
      required this.fiber,
      required this.sugar});

  Map<String, dynamic> toMap() {
    return {
      'food_name': foodName,
      'date': DateFormat('yyyy-MM-dd').format(date),
      'eat_time': eatTime,
    };
  }
}
