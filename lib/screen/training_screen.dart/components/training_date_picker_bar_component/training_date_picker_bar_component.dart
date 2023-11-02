import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/cubit/training_date_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';
import 'package:gym_lifes_app/widget/date_picker_bar_widget.dart';
import 'package:intl/intl.dart';

class TrainingDatePickerBarComponent extends StatelessWidget {
  const TrainingDatePickerBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingDateCubit, TrainingDateState>(
      builder: (context, state) {
        if (state is TrainingDateValueState) {
          final DateTime currentDate = state.currentDate;
          final DateFormat formatter = DateFormat('EEEE, d MMM');

          bool isToday = state.difference == 0;
          bool isTomorrow = state.difference == 1;
          bool isYesterday = state.difference == -1;

          String dateText = formatter.format(currentDate);

          if (isToday) {
            dateText = 'Today';
          } else if (isTomorrow) {
            dateText = 'Tomorrow';
          } else if (isYesterday) {
            dateText = 'Yesterday';
          }

          return DatePickerBarWidget(
            dateText: dateText,
            initialDate: currentDate,
            onPressedLeftArrow: () {
              context.read<TrainingDateCubit>().decrementDate();
              context.read<TrainingListCubit>().getTrainingDaily(
                  date: currentDate.subtract(const Duration(days: 1)));
            },
            onPressedRightArrow: () {
              context.read<TrainingDateCubit>().incrementDate();
              context.read<TrainingListCubit>().getTrainingDaily(
                  date: currentDate.add(const Duration(days: 1)));
            },
            onChangedDate: (value) {
              if (value != null) {
                context
                    .read<TrainingDateCubit>()
                    .selectDate(selectedDate: value);

                context.read<TrainingListCubit>().getTrainingDaily(date: value);
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
