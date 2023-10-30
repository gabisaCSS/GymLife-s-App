import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/weight_date_cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/weight_field_cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/my_line_chart.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_dropdown_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'Weight Data',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    WeightChartDropdownComponent()
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addWeightScreen);
                    context
                        .read<WeightDateCubit>()
                        .setDate(selectedDate: DateTime.now());
                    context.read<WeightFieldCubit>().clear();
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<WeightTrackerBloc, WeightTrackerState>(
              builder: (context, state) {
            if (state is WeightTrackerLoadedState) {
              return MyLineChart(points: state.points);
            } else if (state is WeightTrackerLoadingState) {
              return const AspectRatio(
                aspectRatio: 2,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
    );
  }
}
