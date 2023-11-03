import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/date_cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/component/recipe_ingr_field_component.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/component/recipe_title_field_component.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/bloc/recipe_analyzer_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_ingr_cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_title_cubit/recipe_title_cubit.dart';

class RecipeAnalyzerScreen extends StatelessWidget {
  const RecipeAnalyzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
            context.read<RecipeTitleCubit>().clear();
            context.read<RecipeIngrCubit>().clear();
            // context.read<RecipeAnalyzerBloc>().add(ClearEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Recipe Analyzer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const RecipeTitleFieldComponent(),
            const SizedBox(
              height: 24,
            ),
            const RecipeIngrFieldComponent(),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final recipeTitleState = context.watch<RecipeTitleCubit>().state;
              final recipeIngrState = context.watch<RecipeIngrCubit>().state;
              final dateState = context.read<DateCubit>().state;

              DateTime date = dateState.currentDate;
              bool isEnabledTitle = recipeTitleState is RecipeTitleAmanState &&
                  recipeTitleState.titleValue.isNotEmpty;
              bool isEnabledIngr = recipeIngrState is RecipeIngrAmanState &&
                  recipeIngrState.ingrValue.isNotEmpty;

              return ElevatedButton(
                  onPressed: isEnabledTitle && isEnabledIngr
                      ? () {
                          context.read<RecipeAnalyzerBloc>().add(
                              SubmitRecipeEvent(
                                  recipeTitle: recipeTitleState.titleValue,
                                  recipeIngr: recipeIngrState.ingrValue,
                                  date: date));
                        }
                      : null,
                  child: const Text('Analyze'));
            }),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<RecipeAnalyzerBloc, RecipeAnalyzerState>(
              builder: (context, state) {
                if (state is RecipeAnalyzerLoadingState) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  );
                } else if (state is RecipeAnalyzerLoadedState) {
                  final NutritionModel data = state.nutritionModel;
                  final nutrisi = data.totalNutrients;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.recipeTitle,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      FoodModel food = FoodModel(
                                          foodName: state.recipeTitle,
                                          calori: nutrisi.enercKcal,
                                          carbs: nutrisi.carb,
                                          protein: nutrisi.protein,
                                          fat: nutrisi.fat,
                                          fiber: nutrisi.fiber,
                                          sugar: nutrisi.sugar,
                                          eatTime: args,
                                          date: state.date);

                                      final String notif =
                                          '${state.recipeTitle} successfully added to your $args';

                                      switch (args) {
                                        case 'Breakfast':
                                          context
                                              .read<BreakfastCubit>()
                                              .addBreakfast(food: food);
                                          break;
                                        case 'Lunch':
                                          context
                                              .read<LunchCubit>()
                                              .addLunch(food: food);
                                          break;
                                        case 'Dinner':
                                          context
                                              .read<DinnerCubit>()
                                              .addDinner(food: food);
                                          break;
                                        default:
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(notif)));
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            ),
                            Text(
                                'Energi    : ${nutrisi.enercKcal.quantity.toStringAsFixed(0)} ${nutrisi.enercKcal.unit}'),
                            Text(
                                'Carbs    : ${nutrisi.carb.quantity.toStringAsFixed(0)} ${nutrisi.carb.unit}'),
                            Text(
                                'Protein  : ${nutrisi.protein.quantity.toStringAsFixed(0)} ${nutrisi.protein.unit}'),
                            Text(
                                'Fat         : ${nutrisi.fat.quantity.toStringAsFixed(0)} ${nutrisi.fat.unit}'),
                            Text(
                                'Fiber      : ${nutrisi.fiber.quantity.toStringAsFixed(0)} ${nutrisi.fiber.unit}'),
                            Text(
                                'Sugar     : ${nutrisi.sugar.quantity.toStringAsFixed(0)} ${nutrisi.sugar.unit}'),
                          ]),
                    ),
                  );
                } else if (state is RecipeAnalyzerErrorState) {
                  return Text(state.errorMessage);
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
