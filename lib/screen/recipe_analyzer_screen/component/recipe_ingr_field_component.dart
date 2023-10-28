import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/recipe_analyzer_screen/cubit/recipe_ingr_cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/widget/text_field_widget.dart';

class RecipeIngrFieldComponent extends StatelessWidget {
  const RecipeIngrFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeIngrCubit, RecipeIngrState>(
      builder: (context, state) {
        if (state is RecipeIngrErrorState) {
          return TextFieldWidget(
            label: 'Ingredients',
            hintText: 'Ex: \n1 cup of rice\n1 tablespoon of sweet soy sauce',
            maxLines: 5,
            errorText: state.errorMessage,
            onChanged: (value) {
              context.read<RecipeIngrCubit>().onChangedIngr(value);
            },
          );
        } else if (state is RecipeIngrAmanState) {
          return TextFieldWidget(
            label: 'Ingredients',
            hintText: 'Ex: \n1 cup of rice\n1 tablespoon of sweet soy sauce',
            maxLines: 5,
            onChanged: (value) {
              context.read<RecipeIngrCubit>().onChangedIngr(value);
            },
          );
        } else if (state is RecipeIngrClearState) {
          return TextFieldWidget(
            label: 'Ingredients',
            hintText: 'Ex: \n1 cup of rice\n1 tablespoon of sweet soy sauce',
            maxLines: 5,
            controller: TextEditingController(text: ''),
            onChanged: (value) {
              context.read<RecipeIngrCubit>().onChangedIngr(value);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
