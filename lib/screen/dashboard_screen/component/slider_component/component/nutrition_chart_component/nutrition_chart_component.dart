import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/cubit/calorie_progress_counter_cubit.dart';
import 'package:gym_lifes_app/style/box_decoration_style.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';
import 'package:gym_lifes_app/widget/nutrition_pie_chart_widget.dart';

class NutritionChartComponent extends StatelessWidget {
  const NutritionChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecorationStyle.basicBox,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Macro Nutrition',
              style: TextStyleWidget.m3Header2(),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<CalorieProgressCounterCubit,
                CalorieProgressCounterState>(
              builder: (context, state) {
                if (state is CalorieProgressCounterValueState) {
                  Map<String, double> mapData = {
                    'Carbs': state.totalCarbs,
                    'Protein': state.totalProtein,
                    'Sugar': state.totalSugar,
                    'Fat': state.totalFat,
                    'Fiber': state.totalFiber,
                  };
                  return NutritionPieChartWidget(mapData: mapData);
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
