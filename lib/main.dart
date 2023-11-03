import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/add_weight_screen_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_field_component/cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/cubit/calorie_progress_counter_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/dot_indicator_component/cubit/dot_indicator_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_nutrition_chart_component.dart';
import 'package:gym_lifes_app/screen/food_screen/cubit/food_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/date_cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/screen/main_screen/main_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/mains_bloc/mains_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/bloc/recipe_analyzer_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_ingr_cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_title_cubit/recipe_title_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/recipe_analyzer_screen.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/add_training_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/cubit/exercise_name_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/cubit/rep_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/cubit/set_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/cubit/training_weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/edit_training_component.dart/edit_training_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/cubit/training_chart_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/training_chart_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/cubit/training_date_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainsBloc>(
            create: (context) => MainsBloc(),
          ),
          BlocProvider<RecipeTitleCubit>(
            create: (context) => RecipeTitleCubit(),
          ),
          BlocProvider<RecipeIngrCubit>(
            create: (context) => RecipeIngrCubit(),
          ),
          BlocProvider<FoodCubit>(
            create: (context) => FoodCubit(),
          ),
          BlocProvider<BreakfastCubit>(
            create: (context) => BreakfastCubit(),
          ),
          BlocProvider<LunchCubit>(
            create: (context) => LunchCubit(),
          ),
          BlocProvider<DinnerCubit>(
            create: (context) => DinnerCubit(),
          ),
          BlocProvider<DateCubit>(
            create: (context) => DateCubit(),
          ),
          BlocProvider<DotIndicatorCubit>(
            create: (context) => DotIndicatorCubit(),
          ),
          BlocProvider<ExerciseNameFieldCubit>(
            create: (context) => ExerciseNameFieldCubit(),
          ),
          BlocProvider<SetFieldCubit>(
            create: (context) => SetFieldCubit(),
          ),
          BlocProvider<RepFieldCubit>(
            create: (context) => RepFieldCubit(),
          ),
          BlocProvider<TrainingWeightFieldCubit>(
            create: (context) => TrainingWeightFieldCubit(),
          ),
          BlocProvider<CalorieProgressCounterCubit>(
            create: (context) => CalorieProgressCounterCubit(),
          ),
          BlocProvider<TrainingDateCubit>(
            create: (context) => TrainingDateCubit(),
          ),
          BlocProvider<TrainingListCubit>(
            create: (context) => TrainingListCubit(),
          ),
          BlocProvider<TrainingChartCubit>(
            create: (context) => TrainingChartCubit(),
          ),
          BlocProvider<WeightDateCubit>(
            create: (context) => WeightDateCubit(),
          ),
          BlocProvider<WeightTrackerDropdownCubit>(
            create: (context) => WeightTrackerDropdownCubit(),
          ),
          BlocProvider<WeightFieldCubit>(
            create: (context) => WeightFieldCubit(),
          ),
          BlocProvider<RecipeAnalyzerBloc>(
            create: (context) => RecipeAnalyzerBloc(),
          ),
          BlocProvider<WeightTrackerBloc>(
            create: (context) => WeightTrackerBloc(),
          ),
        ],
        child: MaterialApp(
          title: "Gym Life's App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          // home: const TesScreen(),
          initialRoute: Routes.mainScreen,
          routes: {
            Routes.mainScreen: (context) => const MainScreen(),
            Routes.addExerciseScreen: (context) => const AddTrainingComponent(),
            Routes.totalNutritionScreen: (context) =>
                const FoodNutritionChartComponent(),
            Routes.recipeAnalyzerScreen: (context) =>
                const RecipeAnalyzerScreen(),
            Routes.addWeightScreen: (context) =>
                const AddWeightScreenComponent(),
            Routes.editExerciseScreen: (context) =>
                const EditTrainingComponent(),
            Routes.trainingChartScreen: (context) =>
                const TrainingChartComponent(),
          },
        ));
  }
}
