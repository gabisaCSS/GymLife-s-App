import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/add_weight_screen.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/weight_date_cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/weight_field_cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_dropdown_cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/show_total_nutrition_component.dart';
import 'package:gym_lifes_app/screen/food_screen/date_cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/screen/main_screen/main_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/mains_bloc/mains_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/bloc/recipe_analyzer_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_ingr_cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_title_cubit/recipe_title_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/recipe_analyzer_screen.dart';

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
          BlocProvider<MainsBloc>(create: (context) => MainsBloc()),
          BlocProvider<RecipeTitleCubit>(
              create: (context) => RecipeTitleCubit()),
          BlocProvider<RecipeIngrCubit>(create: (context) => RecipeIngrCubit()),
          BlocProvider<BreakfastCubit>(create: (context) => BreakfastCubit()),
          BlocProvider<LunchCubit>(create: (context) => LunchCubit()),
          BlocProvider<DinnerCubit>(create: (context) => DinnerCubit()),
          BlocProvider<DateCubit>(create: (context) => DateCubit()),
          BlocProvider<WeightDateCubit>(create: (context) => WeightDateCubit()),
          BlocProvider<WeightTrackerDropdownCubit>(
              create: (context) => WeightTrackerDropdownCubit()),
          BlocProvider<WeightFieldCubit>(
              create: (context) => WeightFieldCubit()),
          BlocProvider<RecipeAnalyzerBloc>(
              create: (context) => RecipeAnalyzerBloc()),
          BlocProvider<WeightTrackerBloc>(
              create: (context) => WeightTrackerBloc()),
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
            Routes.totalNutritionScreen: (context) =>
                const ShowTotalNutritionComponent(),
            Routes.recipeAnalyzerScreen: (context) =>
                const RecipeAnalyzerScreen(),
            Routes.addWeightScreen: (context) => const AddWeightScreen(),
          },
        ));
  }
}
