import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/training_model/training_model.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/cubit/exercise_name_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/exercise_name_field_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/cubit/rep_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/rep_field_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/cubit/set_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/set_field_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/cubit/training_weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/training_weight_field_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/cubit/training_date_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';

class AddTrainingComponent extends StatelessWidget {
  const AddTrainingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Exercise'),
        leading: IconButton(
          onPressed: () {
            context.read<ExerciseNameFieldCubit>().clear();
            context.read<SetFieldCubit>().clear();
            context.read<RepFieldCubit>().clear();
            context.read<TrainingWeightFieldCubit>().clear();

            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Builder(builder: (context) {
            final exerciseNameFieldState =
                context.watch<ExerciseNameFieldCubit>().state;
            final setFieldState = context.watch<SetFieldCubit>().state;
            final repFieldState = context.watch<RepFieldCubit>().state;
            final trainingWeightFieldState =
                context.watch<TrainingWeightFieldCubit>().state;

            bool isEnabledExerciseName =
                exerciseNameFieldState is ExerciseNameFieldAmanState &&
                    exerciseNameFieldState.nameValue.isNotEmpty;
            bool isEnabledSet = setFieldState is SetFieldAmanState &&
                setFieldState.setValue > 0;
            bool isEnabledRep = repFieldState is RepFieldAmanState &&
                repFieldState.repValue > 0;
            bool isEnabledTrainingWeight =
                trainingWeightFieldState is TrainingWeightFieldAmanState &&
                    trainingWeightFieldState.weightValue >= 0;

            bool isAllEnabled = isEnabledExerciseName &&
                isEnabledSet &&
                isEnabledRep &&
                isEnabledTrainingWeight;

            return IconButton(
              onPressed: isAllEnabled
                  ? () {
                      final trainingDateState =
                          context.read<TrainingDateCubit>().state;

                      TrainingModel trainingModel = TrainingModel(
                        weight: trainingWeightFieldState.weightValue,
                        date: trainingDateState.currentDate,
                        exerciseName: exerciseNameFieldState.nameValue,
                        sets: setFieldState.setValue,
                        reps: repFieldState.repValue,
                      );

                      context
                          .read<TrainingListCubit>()
                          .addTraining(trainingModel: trainingModel);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Exercise Succesfuly Added!')));
                    }
                  : null,
              icon: const Icon(Icons.check),
            );
          })
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            ExerciseNameFieldComponent(),
            SizedBox(
              height: 8,
            ),
            SetFieldComponent(),
            Divider(),
            RepFieldComponent(),
            Divider(),
            TrainingWeightFieldComponent(),
            Divider()
          ],
        ),
      ),
    );
  }
}
