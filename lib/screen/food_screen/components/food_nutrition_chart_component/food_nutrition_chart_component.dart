import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/breakfast_component/cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/dinner_component/cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/lunch_component/cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';
import 'package:gym_lifes_app/widget/nutrition_pie_chart_widget.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class FoodNutritionChartComponent extends StatelessWidget {
  const FoodNutritionChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Chart'),
      ),
      body: Builder(builder: (context) {
        final dateState = context.read<DateCubit>().state;
        final breakfastState = context.watch<BreakfastCubit>().state;
        final lunchState = context.watch<LunchCubit>().state;
        final dinnerState = context.watch<DinnerCubit>().state;

        List<Equatable> stateList = [breakfastState, lunchState, dinnerState];

        double totalCalorie = 0;
        double totalProtein = 0;
        double totalCarbs = 0;
        double totalFiber = 0;
        double totalFat = 0;
        double totalSugar = 0;

        for (var state in stateList) {
          if (state is BreakfastValueState) {
            totalCalorie += state.totalCalories;
            totalProtein += state.totalProtein;
            totalFat += state.totalFat;
            totalFiber += state.totalFiber;
            totalCarbs += state.totalCarbs;
            totalSugar += state.totalSugar;
          } else if (state is LunchValueState) {
            totalCalorie += state.totalCalories;
            totalProtein += state.totalProtein;
            totalFat += state.totalFat;
            totalFiber += state.totalFiber;
            totalCarbs += state.totalCarbs;
            totalSugar += state.totalSugar;
          } else if (state is DinnerValueState) {
            totalCalorie += state.totalCalories;
            totalProtein += state.totalProtein;
            totalFat += state.totalFat;
            totalFiber += state.totalFiber;
            totalCarbs += state.totalCarbs;
            totalSugar += state.totalSugar;
          }
        }

        Map<String, double> mapData = {
          'Carbs': totalCarbs,
          'Sugar': totalSugar,
          'Fat': totalFat,
          'Fiber': totalFiber,
          'Protein': totalProtein,
        };

        final DateTime currentDate = dateState.currentDate;
        final DateFormat formatter = DateFormat('EEEE, d MMM');

        bool isToday = dateState.difference == 0;
        bool isTomorrow = dateState.difference == 1;
        bool isYesterday = dateState.difference == -1;

        String dateText = formatter.format(currentDate);

        if (isToday) {
          dateText = 'Today';
        } else if (isTomorrow) {
          dateText = 'Tomorrow';
        } else if (isYesterday) {
          dateText = 'Yesterday';
        }

        return Container(
          color: Colors.white,
          width: double.infinity,
          // height: 600,
          // margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Nutrition',
                      style: TextStyleWidget.m3Header2(),
                    ),
                    Text(
                      dateText,
                      style: TextStyleWidget.m3BodySmall(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                NutritionPieChartWidget(
                  mapData: mapData,
                  chartRadius: 250,
                  chartType: ChartType.ring,
                  legendPosition: LegendPosition.bottom,
                  centerText: '${totalCalorie.toStringAsFixed(0)}\nKcal',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
