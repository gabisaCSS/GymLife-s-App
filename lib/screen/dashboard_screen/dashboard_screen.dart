import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_dropdown_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_dropdown_cubit/weight_tracker_dropdown_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final dropdownState = context.read<WeightTrackerDropdownCubit>().state;
    if (dropdownState is WeightTrackerDropdownValueState) {
      WeightChartDropdownComponent.getWeightBasedTimeline(
          context, dropdownState.value);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          WeightChart(),
        ],
      ),
    );
  }
}
