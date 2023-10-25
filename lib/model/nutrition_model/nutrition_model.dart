// To parse this JSON data, do
//
//     final nutritionModel = nutritionModelFromJson(jsonString);

import 'dart:convert';

NutritionModel nutritionModelFromJson(String str) =>
    NutritionModel.fromJson(json.decode(str));

class NutritionModel {
  int? calories;
  Nutrients totalNutrients;
  Map<String, NutrientsData> totalDaily;
  List<Ingredient> ingredients;
  NutrientsKCal totalNutrientsKCal;

  NutritionModel({
    required this.calories,
    required this.totalNutrients,
    required this.totalDaily,
    required this.ingredients,
    required this.totalNutrientsKCal,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
        calories: json["calories"],
        totalNutrients: Nutrients.fromJson(json["totalNutrients"]),
        totalDaily: Map.from(json["totalDaily"]).map((k, v) =>
            MapEntry<String, NutrientsData>(k, NutrientsData.fromJson(v))),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        totalNutrientsKCal: NutrientsKCal.fromJson(json["totalNutrientsKCal"]),
      );
}

class Nutrients {
  NutrientsData enercKcal;
  NutrientsData protein;
  NutrientsData carb;
  NutrientsData fat;
  NutrientsData fiber;
  NutrientsData sugar;

  Nutrients({
    required this.enercKcal,
    required this.fat,
    required this.protein,
    required this.carb,
    required this.fiber,
    required this.sugar,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        enercKcal: NutrientsData.fromJson(json["ENERC_KCAL"]),
        fat: NutrientsData.fromJson(json["FAT"]),
        protein: NutrientsData.fromJson(json["PROCNT"]),
        carb: NutrientsData.fromJson(json["CHOCDF"]),
        fiber: json["FIBTG"] == null
            ? NutrientsData(label: 'Fiber', quantity: 0, unit: 'gr')
            : NutrientsData.fromJson(json["FIBTG"]),
        sugar: json["SUGAR"] == null
            ? NutrientsData(label: 'Sugar', quantity: 0, unit: 'gr')
            : NutrientsData.fromJson(json["SUGAR"]),
      );
}

class Ingredient {
  String text;
  List<Parsed>? parsed;

  Ingredient({
    required this.text,
    required this.parsed,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        // parsed:
        // List<Parsed>.from(json["parsed"].map((x) => Parsed.fromJson(x))),
        parsed: json["parsed"] == null
            ? []
            : List<Parsed>.from(json["parsed"].map((x) => Parsed.fromJson(x))),
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
  Nutrients nutrients;

  Parsed({
    required this.quantity,
    required this.measure,
    required this.foodMatch,
    required this.food,
    required this.foodId,
    required this.weight,
    required this.retainedWeight,
    required this.nutrients,
  });

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        quantity: json["quantity"],
        measure: json["measure"],
        foodMatch: json["foodMatch"],
        food: json["food"],
        foodId: json["foodId"],
        weight: json["weight"],
        retainedWeight: json["retainedWeight"],
        nutrients: Nutrients.fromJson(json['nutrients']),
      );
}

class NutrientsData {
  String? label;
  double? quantity;
  String? unit;

  NutrientsData({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  factory NutrientsData.fromJson(Map<String, dynamic> json) => NutrientsData(
        label: json["label"],
        quantity: json["quantity"]?.toDouble(),
        unit: json["unit"],
      );
}

class NutrientsKCal {
  NutrientsData enercKcal;
  NutrientsData procntKcal;
  NutrientsData fatKcal;
  NutrientsData chocdfKcal;

  NutrientsKCal({
    required this.enercKcal,
    required this.procntKcal,
    required this.fatKcal,
    required this.chocdfKcal,
  });

  factory NutrientsKCal.fromJson(Map<String, dynamic> json) => NutrientsKCal(
        enercKcal: NutrientsData.fromJson(json["ENERC_KCAL"]),
        procntKcal: NutrientsData.fromJson(json["PROCNT_KCAL"]),
        fatKcal: NutrientsData.fromJson(json["FAT_KCAL"]),
        chocdfKcal: NutrientsData.fromJson(json["CHOCDF_KCAL"]),
      );
}
