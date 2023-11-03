import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/cubit/calorie_progress_counter_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/slider_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/weight_chart_dropdown_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/weight_chart_component.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';

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
    context.read<CalorieProgressCounterCubit>().getTodayFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text('Today', style: TextStyleWidget.m3Header1()),
            const SizedBox(
              height: 16,
            ),
            const SliderComponent(),
            const SizedBox(
              height: 34,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: WeightChartComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
