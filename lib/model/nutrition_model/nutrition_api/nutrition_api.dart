import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_lifes_app/constants/api.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';

class NutritionApi {
  static Future<NutritionModel> getNutrition(
      {required String title, required List<String> ingr}) async {
    print(jsonEncode({"title": title, "ingr": ingr}));
    try {} catch (e) {}
    final response = await Dio().post(
        'https://api.edamam.com/api/nutrition-details?app_id=$appId&app_key=$appKey',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode({"title": title, "ingr": ingr}));

    NutritionModel nutritionModel = NutritionModel.fromJson(response.data);

    return (nutritionModel);
    // print(nutritionModel
    //     .ingredients.first.parsed.first.nutrients['ENERC_KCAL']?.quantity);
  }
}
