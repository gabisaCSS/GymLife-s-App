import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/cubit/exercise_name_field_cubit.dart';
import 'package:gym_lifes_app/widget/text_field_widget.dart';

class ExerciseNameFieldComponent extends StatelessWidget {
  const ExerciseNameFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseNameFieldCubit, ExerciseNameFieldState>(
      builder: (context, state) {
        if (state is ExerciseNameFieldAmanState) {
          return TextFieldWidget(
            label: 'Exercise Name',
            floatingLabelBehavior: null,
            filled: false,
            onChanged: (nameValue) {
              context
                  .read<ExerciseNameFieldCubit>()
                  .onChangedExerciseName(nameValue);
            },
          );
        } else if (state is ExerciseNameFieldInitial) {
          return TextFieldWidget(
            label: 'Exercise Name',
            floatingLabelBehavior: null,
            controller: TextEditingController(text: state.initValue),
            filled: false,
            onChanged: (nameValue) {
              context
                  .read<ExerciseNameFieldCubit>()
                  .onChangedExerciseName(nameValue);
            },
          );
        } else if (state is ExerciseNameFieldErrorState) {
          return TextFieldWidget(
            label: 'Exercise Name',
            floatingLabelBehavior: null,
            errorText: state.errorText,
            filled: false,
            onChanged: (nameValue) {
              context
                  .read<ExerciseNameFieldCubit>()
                  .onChangedExerciseName(nameValue);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
