import 'package:flutter/material.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/add_weight_screen_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_nutrition_chart_component/food_nutrition_chart_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/recipe_analyzer_screen_component/recipe_analyzer_screen_component.dart';
import 'package:gym_lifes_app/screen/main_screen/main_screen.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/add_training_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/edit_training_component.dart/edit_training_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/training_chart_component.dart';

class Routes {
  static const String mainScreen = '/';
  static const String recipeAnalyzerScreen = '/recipe';
  static const String totalNutritionScreen = '/total';
  static const String addWeightScreen = '/add-weight';
  static const String addExerciseScreen = '/add-exercise';
  static const String editExerciseScreen = '/edit-exercise';
  static const String trainingChartScreen = '/training-chart';

  static final Map<String, WidgetBuilder> routes = {
    Routes.mainScreen: (context) => const MainScreen(),
    Routes.addExerciseScreen: (context) => const AddTrainingComponent(),
    Routes.totalNutritionScreen: (context) =>
        const FoodNutritionChartComponent(),
    Routes.recipeAnalyzerScreen: (context) =>
        const RecipeAnalyzerScreenComponent(),
    Routes.addWeightScreen: (context) => const AddWeightScreenComponent(),
    Routes.editExerciseScreen: (context) => const EditTrainingComponent(),
    Routes.trainingChartScreen: (context) => const TrainingChartComponent(),
  };
}
