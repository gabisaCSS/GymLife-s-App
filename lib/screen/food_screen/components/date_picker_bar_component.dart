import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/date_cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';
import 'package:intl/intl.dart';

class DatePickerBarComponent extends StatelessWidget {
  const DatePickerBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: BlocBuilder<DateCubit, DateState>(builder: (context, state) {
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

          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  onPressed: () {
                    context.read<DateCubit>().decrementDate();
                    context.read<BreakfastCubit>().getBreakfast(
                        date: currentDate.add(const Duration(days: -1)));
                    context.read<LunchCubit>().getLunch(
                        date: currentDate.add(const Duration(days: -1)));
                    context.read<DinnerCubit>().getDinner(
                        date: currentDate.add(const Duration(days: -1)));
                  },
                ),
                TextButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025))
                        .then((value) {
                      if (value != null) {
                        context
                            .read<DateCubit>()
                            .selectDate(selectedDate: value);
                        context
                            .read<BreakfastCubit>()
                            .getBreakfast(date: value);
                        context.read<LunchCubit>().getLunch(date: value);
                        context.read<DinnerCubit>().getDinner(date: value);
                      }
                    });
                  },
                  child: Text(
                    dateText,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right_outlined),
                  onPressed: () {
                    context.read<DateCubit>().incrementDate();
                    context.read<BreakfastCubit>().getBreakfast(
                        date: currentDate.add(const Duration(days: 1)));
                    context.read<LunchCubit>().getLunch(
                        date: currentDate.add(const Duration(days: 1)));
                    context.read<DinnerCubit>().getDinner(
                        date: currentDate.add(const Duration(days: 1)));
                  },
                ),
              ]);
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
