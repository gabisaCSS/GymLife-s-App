import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_list_component.dart';
import 'package:gym_lifes_app/screen/food_screen/date_cubit/date_cubit.dart';

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
