import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';

class NutritionApi {
  static Future<NutritionModel> postNutrition(
      {required String title, required List<String> ingr}) async {
    final response = await Dio().post(
        'https://api.edamam.com/api/nutrition-details?app_id=5dd927a7&app_key=3ed1ac3409696d4ee70daa4b2d87e2d5',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode({"title": title, "ingr": ingr}));

    NutritionModel nutritionModel = NutritionModel.fromJson(response.data);

    return (nutritionModel);
    // print(nutritionModel
    //     .ingredients.first.parsed.first.nutrients['ENERC_KCAL']?.quantity);
  }
}
