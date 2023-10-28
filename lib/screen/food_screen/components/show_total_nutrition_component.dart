import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';

class ShowTotalNutritionComponent extends StatelessWidget {
  const ShowTotalNutritionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
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

        List<NutrientsData> totalNutrition = [
          NutrientsData(label: 'Calorie', quantity: totalCalorie, unit: 'Kcal'),
          NutrientsData(
              label: 'Carbohydrate', quantity: totalCarbs, unit: 'gr'),
          NutrientsData(label: 'Protein', quantity: totalProtein, unit: 'gr'),
          NutrientsData(label: 'Fat', quantity: totalFat, unit: 'gr'),
          NutrientsData(label: 'Fiber', quantity: totalFiber, unit: 'gr'),
          NutrientsData(label: 'Sugar', quantity: totalSugar, unit: 'gr')
        ];

        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListView.builder(
                  itemCount: totalNutrition.length,
                  itemBuilder: (context, index) {
                    final data = totalNutrition[index];
                    return Text(
                        '${data.label}\t: ${data.quantity} ${data.unit}');
                  })),
        );
      }),
    );
  }
}
