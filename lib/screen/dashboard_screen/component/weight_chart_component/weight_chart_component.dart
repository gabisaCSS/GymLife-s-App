import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_field_component/cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/weight_chart_dropdown_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_line_chart_component/weight_line_chart_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';
import 'package:gym_lifes_app/style/box_decoration_style.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';

class WeightChartComponent extends StatelessWidget {
  const WeightChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecorationStyle.basicBox,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Body Weight',
                      style: TextStyleWidget.m3Header2(),
                    ),
                    const WeightChartDropdownComponent()
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
              return Padding(
                padding: const EdgeInsets.only(right: 37),
                child: WeightLineChartComponent(weightList: state.points),
              );
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
