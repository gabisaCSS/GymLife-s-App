import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/cubit/training_date_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/components/list_component/list_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';

class TrainingListComponent extends StatefulWidget {
  const TrainingListComponent({super.key});

  @override
  State<TrainingListComponent> createState() => _TrainingListComponentState();
}

class _TrainingListComponentState extends State<TrainingListComponent> {
  @override
  void initState() {
    final trainingDateState = context.read<TrainingDateCubit>().state;

    context
        .read<TrainingListCubit>()
        .getTrainingDaily(date: trainingDateState.currentDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingListCubit, TrainingListState>(
      builder: (context, state) {
        if (state is TrainingListLoadedState) {
          return ListComponent(
            title: 'Training',
            trainingList: state.trainingList,
            onPressedTextButton: () {
              Navigator.pushNamed(context, Routes.addExerciseScreen);
            },
          );
        } else if (state is TrainingListLoadingState) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
