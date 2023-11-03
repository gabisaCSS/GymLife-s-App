import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_list_component/food_list_component.dart';
import 'package:gym_lifes_app/screen/food_screen/components/lunch_component/cubit/lunch_cubit.dart';

class LunchComponent extends StatefulWidget {
  const LunchComponent({super.key});

  @override
  State<LunchComponent> createState() => _LunchComponentState();
}

class _LunchComponentState extends State<LunchComponent> {
  @override
  void initState() {
    final dateState = context.read<DateCubit>().state;
    context.read<LunchCubit>().getLunch(date: dateState.currentDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LunchCubit, LunchState>(builder: (context, state) {
      if (state is LunchValueState) {
        return FoodListComponent(
            title: 'Lunch',
            foodList: state.lunchList,
            totalCalorie: state.totalCalories);
      } else {
        return const SizedBox();
      }
    });
  }
}
