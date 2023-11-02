import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/training_model/training_model.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/cubit/exercise_name_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/cubit/rep_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/cubit/set_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/cubit/training_weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/cubit/training_chart_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';

class ListComponent extends StatelessWidget {
  final String title;
  final List<TrainingModel> trainingList;
  final void Function()? onPressedTextButton;
  final void Function()? onTap;
  const ListComponent({
    super.key,
    required this.title,
    required this.trainingList,
    this.onPressedTextButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const Divider(),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: trainingList.length,
            itemBuilder: (context, index) {
              final training = trainingList[index];
              return GestureDetector(
                onDoubleTap: () {
                  Navigator.pushNamed(context, Routes.trainingChartScreen);
                  context
                      .read<TrainingChartCubit>()
                      .getTraining(exerciseName: training.exerciseName);
                },
                child: ListTile(
                  title: Text(training.exerciseName),
                  subtitle: Text(
                      '${training.sets} sets, ${training.reps} reps, ${training.weight} Kg'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.editExerciseScreen,
                                arguments: training);

                            context
                                .read<SetFieldCubit>()
                                .onEditSet(training.sets);
                            context
                                .read<RepFieldCubit>()
                                .onEditRep(training.reps);
                            context
                                .read<ExerciseNameFieldCubit>()
                                .onEditExerciseName(training.exerciseName);
                            context
                                .read<TrainingWeightFieldCubit>()
                                .onEditTrainingWeight(training.weight);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delete Exercise'),
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              'Are you sure to delete ${training.exerciseName} from your training?')
                                        ]),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<TrainingListCubit>()
                                              .deleteTraining(
                                                  trainingModel: training);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(Icons.remove_outlined))
                    ],
                  ),
                ),
              );
            },
          ),
          (trainingList.isNotEmpty) ? const Divider() : const SizedBox(),
          TextButton(
              onPressed: onPressedTextButton,
              child: const Text('Add Exercise')),
        ],
      ),
    );
  }
}
