import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';

class RemainingCaloriesCounterComponent extends StatelessWidget {
  const RemainingCaloriesCounterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final breakfastState = context.watch<BreakfastCubit>().state;
      final lunchState = context.watch<LunchCubit>().state;
      final dinnerState = context.watch<DinnerCubit>().state;
      double target = 2032;
      double sisa = 0;
      double totalCalorie = 0;

      totalCalorie += breakfastState.totalCalories;
      totalCalorie += lunchState.totalCalories;
      totalCalorie += dinnerState.totalCalories;

      sisa = target - totalCalorie;

      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.totalNutritionScreen);
        },
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Calories Left',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(target.toStringAsFixed(0)),
                      const Text('Target'),
                    ],
                  ),
                  const Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                  Column(
                    children: [
                      Text(totalCalorie.toStringAsFixed(0)),
                      const Text('Food'),
                    ],
                  ),
                  const Text(
                    '=',
                    style: TextStyle(fontSize: 20),
                  ),
                  Column(
                    children: [
                      Text(sisa.toStringAsFixed(0)),
                      const Text('Left'),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}
