import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/dinner_component/cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/food_list_component/food_list_component.dart';

class DinnerComponent extends StatefulWidget {
  const DinnerComponent({super.key});

  @override
  State<DinnerComponent> createState() => _DinnerComponentState();
}

class _DinnerComponentState extends State<DinnerComponent> {
  @override
  void initState() {
    final dateState = context.read<DateCubit>().state;
    context.read<DinnerCubit>().getDinner(date: dateState.currentDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DinnerCubit, DinnerState>(builder: (context, state) {
      if (state is DinnerValueState) {
        return FoodListComponent(
            title: 'Dinner',
            foodList: state.dinnerList,
            totalCalorie: state.totalCalories);
      } else {
        return const SizedBox();
      }
    });
  }
}
