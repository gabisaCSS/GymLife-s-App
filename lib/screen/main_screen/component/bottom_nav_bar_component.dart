import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/dashboard_bloc/dashboard_bloc.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bottomNavigationBar({required int currentIndex}) {
      const List<BottomNavigationBarItem> items = [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined), label: 'Food'),
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), label: 'Training'),
      ];
      return BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber,
        items: items,
        onTap: (int index) {
          context
              .read<DashboardBloc>()
              .add(ChangedBottomNavBarEvent(index: index));
        },
      );
    }

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardScreenState) {
          return bottomNavigationBar(currentIndex: state.index);
        } else if (state is FoodScreenState) {
          return bottomNavigationBar(currentIndex: state.index);
        } else if (state is TrainingScreenState) {
          return bottomNavigationBar(currentIndex: state.index);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}