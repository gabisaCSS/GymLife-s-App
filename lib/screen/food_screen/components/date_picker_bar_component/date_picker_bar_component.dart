import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/breakfast_component/cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/dinner_component/cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/lunch_component/cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/widget/date_picker_bar_widget.dart';
import 'package:intl/intl.dart';

class DatePickerBarComponent extends StatelessWidget {
  const DatePickerBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        if (state is DateValueState) {
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
              context.read<DateCubit>().decrementDate();
              context.read<BreakfastCubit>().getBreakfast(
                  date: currentDate.add(const Duration(days: -1)));
              context
                  .read<LunchCubit>()
                  .getLunch(date: currentDate.add(const Duration(days: -1)));
              context
                  .read<DinnerCubit>()
                  .getDinner(date: currentDate.add(const Duration(days: -1)));
            },
            onPressedRightArrow: () {
              context.read<DateCubit>().incrementDate();
              context
                  .read<BreakfastCubit>()
                  .getBreakfast(date: currentDate.add(const Duration(days: 1)));
              context
                  .read<LunchCubit>()
                  .getLunch(date: currentDate.add(const Duration(days: 1)));
              context
                  .read<DinnerCubit>()
                  .getDinner(date: currentDate.add(const Duration(days: 1)));
            },
            onChangedDate: (DateTime? value) {
              if (value != null) {
                context.read<DateCubit>().selectDate(selectedDate: value);
                context.read<BreakfastCubit>().getBreakfast(date: value);
                context.read<LunchCubit>().getLunch(date: value);
                context.read<DinnerCubit>().getDinner(date: value);
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
