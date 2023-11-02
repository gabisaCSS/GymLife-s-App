import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/constants/extension.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/component/line_chart_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/cubit/training_chart_cubit.dart';
import 'package:gym_lifes_app/style/box_decoration_style.dart';

class TrainingChartComponent extends StatelessWidget {
  const TrainingChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Chart'),
      ),
      body: BlocBuilder<TrainingChartCubit, TrainingChartState>(
        builder: (context, state) {
          if (state is TrainingChartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrainingChartLoadedState) {
            String exerciseName = state.trainingList[0].exerciseName;
            String capitalizedExerciseName = exerciseName
                .split(' ')
                .map((word) => word.capitalize())
                .join(' ');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$capitalizedExerciseName Progress Chart',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        // border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Text('Weight (kg)'),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: LineChartComponent(
                                trainingList: state.trainingList),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: BoxDecorationStyle.basicBox,
                      width: double.infinity,
                      height: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Text('Set/Rep'),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: LineChartComponent(
                                isWeightOnly: false,
                                trainingList: state.trainingList),
                          )
                        ],
                      ))
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
