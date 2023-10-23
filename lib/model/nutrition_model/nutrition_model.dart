// To parse this JSON data, do
//
//     final nutritionModel = nutritionModelFromJson(jsonString);

import 'dart:convert';

NutritionModel nutritionModelFromJson(String str) =>
    NutritionModel.fromJson(json.decode(str));

class NutritionModel {
  int calories;
  Map<String, TotalDaily> totalNutrients;
  Map<String, TotalDaily> totalDaily;
  List<Ingredient> ingredients;
  TotalNutrientsKCal totalNutrientsKCal;

  NutritionModel({
    required this.calories,
    required this.totalNutrients,
    required this.totalDaily,
    required this.ingredients,
    required this.totalNutrientsKCal,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
        calories: json["calories"],
        totalNutrients: Map.from(json["totalNutrients"]).map(
            (k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]).map(
            (k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        totalNutrientsKCal:
            TotalNutrientsKCal.fromJson(json["totalNutrientsKCal"]),
      );
}

class Ingredient {
  String text;
  List<Parsed> parsed;

  Ingredient({
    required this.text,
    required this.parsed,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        parsed:
            List<Parsed>.from(json["parsed"].map((x) => Parsed.fromJson(x))),
      );
}

class Parsed {
  double quantity;
  String measure;
  String foodMatch;
  String food;
  String foodId;
  double weight;
  double retainedWeight;
  Map<String, TotalDaily> nutrients;
  String measureUri;
  String status;

  Parsed({
    required this.quantity,
    required this.measure,
    required this.foodMatch,
    required this.food,
    required this.foodId,
    required this.weight,
    required this.retainedWeight,
    required this.nutrients,
    required this.measureUri,
    required this.status,
  });

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        quantity: json["quantity"],
        measure: json["measure"],
        foodMatch: json["foodMatch"],
        food: json["food"],
        foodId: json["foodId"],
        weight: json["weight"],
        retainedWeight: json["retainedWeight"],
        nutrients: Map.from(json["nutrients"]).map(
            (k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        measureUri: json["measureURI"],
        status: json["status"],
      );
}

class TotalDaily {
  String label;
  double quantity;
  String unit;

  TotalDaily({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  factory TotalDaily.fromJson(Map<String, dynamic> json) => TotalDaily(
        label: json["label"],
        quantity: json["quantity"]?.toDouble(),
        unit: json["unit"],
      );
}

class TotalNutrientsKCal {
  TotalDaily enercKcal;
  TotalDaily procntKcal;
  TotalDaily fatKcal;
  TotalDaily chocdfKcal;

  TotalNutrientsKCal({
    required this.enercKcal,
    required this.procntKcal,
    required this.fatKcal,
    required this.chocdfKcal,
  });

  factory TotalNutrientsKCal.fromJson(Map<String, dynamic> json) =>
      TotalNutrientsKCal(
        enercKcal: TotalDaily.fromJson(json["ENERC_KCAL"]),
        procntKcal: TotalDaily.fromJson(json["PROCNT_KCAL"]),
        fatKcal: TotalDaily.fromJson(json["FAT_KCAL"]),
        chocdfKcal: TotalDaily.fromJson(json["CHOCDF_KCAL"]),
      );
}
