import 'package:flutter/material.dart';
import 'package:gym_lifes_app/screen/food_screen/components/breakfast_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/dinner_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/lunch_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/remaining_calories_counter_component.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 2,
        ),
        const DatePickerBarComponent(),
        const SizedBox(
          height: 24,
        ),
        const RemainingCaloriesCounterComponent(),
        Expanded(
          child: ListView(
            children: const [
              BreakfastComponent(),
              LunchComponent(),
              DinnerComponent()
            ],
          ),
        ),
      ],
    );
  }
}
