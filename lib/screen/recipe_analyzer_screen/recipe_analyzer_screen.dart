import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/component/recipe_ingr_field_component.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/component/recipe_title_field_component.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/bloc/recipe_analyzer_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_ingr_cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_title_cubit/recipe_title_cubit.dart';

class RecipeAnalyzerScreen extends StatelessWidget {
  const RecipeAnalyzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                'Recipe Analysis',
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
                                recipeIngr: recipeIngrState.ingrValue));
                      }
                    : null,
                child: const Text('Submit'));
          }),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<RecipeAnalyzerBloc, RecipeAnalyzerState>(
            builder: (context, state) {
              if (state is RecipeAnalyzerLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is RecipeAnalyzerLoadedState) {
                final NutritionModel data = state.nutritionModel;
                final nutrisi = data.totalNutrients;

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.recipeTitle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              'Energi    : ${nutrisi.enercKcal.quantity.toStringAsFixed(2)} ${nutrisi.enercKcal.unit}'),
                          Text(
                              'Carbs    : ${nutrisi.carb.quantity.toStringAsFixed(2)} ${nutrisi.carb.unit}'),
                          Text(
                              'Protein  : ${nutrisi.protein.quantity.toStringAsFixed(2)} ${nutrisi.protein.unit}'),
                          Text(
                              'Fat         : ${nutrisi.fat.quantity.toStringAsFixed(2)} ${nutrisi.fat.unit}'),
                          Text(
                              'Fiber      : ${nutrisi.fiber.quantity.toStringAsFixed(2)} ${nutrisi.fiber.unit}'),
                          Text(
                              'Sugar     : ${nutrisi.sugar.quantity.toStringAsFixed(2)} ${nutrisi.sugar.unit}'),
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
    );
  }
}
