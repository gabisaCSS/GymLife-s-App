import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/cubit/recipe_title_cubit/recipe_title_cubit.dart';
import 'package:gym_lifes_app/widget/text_field_widget.dart';

class RecipeTitleFieldComponent extends StatelessWidget {
  const RecipeTitleFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeTitleCubit, RecipeTitleState>(
      builder: (context, state) {
        if (state is RecipeTitleErrorState) {
          return TextFieldWidget(
            label: 'Title',
            hintText: 'Insert Your Recipe Title Here',
            errorText: state.errorMessage,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              context.read<RecipeTitleCubit>().onChangedTitle(value);
            },
          );
        } else if (state is RecipeTitleAmanState) {
          return TextFieldWidget(
            label: 'Title',
            hintText: 'Insert Your Recipe Title Here',
            keyboardType: TextInputType.text,
            onChanged: (value) {
              context.read<RecipeTitleCubit>().onChangedTitle(value);
            },
          );
        } else if (state is RecipeTitleClearState) {
          return TextFieldWidget(
            label: 'Title',
            hintText: 'Insert Your Recipe Title Here',
            keyboardType: TextInputType.text,
            controller: TextEditingController(text: ''),
            onChanged: (value) {
              context.read<RecipeTitleCubit>().onChangedTitle(value);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
