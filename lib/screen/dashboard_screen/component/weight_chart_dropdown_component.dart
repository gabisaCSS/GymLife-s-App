import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_dropdown_cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/widget/dropdown_button_widget.dart';
import 'package:jiffy/jiffy.dart';

class WeightChartDropdownComponent extends StatelessWidget {
  const WeightChartDropdownComponent({super.key});

  static void getWeightBasedTimeline(BuildContext context, String val) {
    switch (val) {
      case 'Since Beginning':
        context.read<WeightTrackerBloc>().add(const GetWeightEvent());
        break;
      case 'Last 90 Days':
        context.read<WeightTrackerBloc>().add(GetWeightEvent(
            sinceDate: Jiffy.now().subtract(months: 3).dateTime));
        break;
      case 'Last 60 Days':
        context.read<WeightTrackerBloc>().add(GetWeightEvent(
            sinceDate: Jiffy.now().subtract(months: 2).dateTime));
        break;
      case 'Last 30 Days':
        context.read<WeightTrackerBloc>().add(GetWeightEvent(
            sinceDate: Jiffy.now().subtract(months: 1).dateTime));
        break;
      case 'Last 2 Weeks':
        context.read<WeightTrackerBloc>().add(GetWeightEvent(
            sinceDate: DateTime.now().subtract(const Duration(days: 14))));
        break;
      case 'Last 1 Week':
        context.read<WeightTrackerBloc>().add(GetWeightEvent(
            sinceDate: DateTime.now().subtract(const Duration(days: 7))));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightTrackerDropdownCubit, WeightTrackerDropdownState>(
      builder: (context, state) {
        if (state is WeightTrackerDropdownValueState) {
          return DropdownButtonWidget(
              value: state.value,
              itemsList: state.items,
              onChanged: (val) {
                if (val != null) {
                  context
                      .read<WeightTrackerDropdownCubit>()
                      .onChangedDropdown(val);

                  getWeightBasedTimeline(context, val);
                }
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
