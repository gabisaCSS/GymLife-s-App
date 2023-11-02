import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/cubit/training_weight_field_cubit.dart';
import 'package:gym_lifes_app/widget/label_and_input_row.dart';

class TrainingWeightFieldComponent extends StatelessWidget {
  const TrainingWeightFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingWeightFieldCubit, TrainingWeightFieldState>(
      builder: (context, state) {
        if (state is TrainingWeightFieldAmanState) {
          return LabelAndInputRow(
            label: 'Weight (Kg)',
            inputBorder: InputBorder.none,
            onChanged: (weightValue) {
              context
                  .read<TrainingWeightFieldCubit>()
                  .onChangedTrainingWeight(weightValue);
            },
          );
        } else if (state is TrainingWeightFieldErrorState) {
          return LabelAndInputRow(
            label: 'Weight (Kg)',
            inputBorder: InputBorder.none,
            onChanged: (weightValue) {
              context
                  .read<TrainingWeightFieldCubit>()
                  .onChangedTrainingWeight(weightValue);
            },
          );
        } else if (state is TrainingWeightFieldInitial) {
          return LabelAndInputRow(
            label: 'Weight (Kg)',
            controller: TextEditingController(text: '${state.initValue}'),
            inputBorder: InputBorder.none,
            onChanged: (weightValue) {
              context
                  .read<TrainingWeightFieldCubit>()
                  .onChangedTrainingWeight(weightValue);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
