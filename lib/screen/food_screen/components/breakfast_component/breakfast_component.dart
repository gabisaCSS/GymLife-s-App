import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/breakfast_component/cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_list_component/food_list_component.dart';

class BreakfastComponent extends StatefulWidget {
  const BreakfastComponent({super.key});

  @override
  State<BreakfastComponent> createState() => _BreakfastComponentState();
}

class _BreakfastComponentState extends State<BreakfastComponent> {
  @override
  void initState() {
    final dateState = context.read<DateCubit>().state;
    context.read<BreakfastCubit>().getBreakfast(date: dateState.currentDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakfastCubit, BreakfastState>(
        builder: (context, state) {
      if (state is BreakfastValueState) {
        return FoodListComponent(
            title: 'Breakfast',
            foodList: state.breakfastList,
            totalCalorie: state.totalCalories);
      } else {
        return const SizedBox();
      }
    });
  }
}
