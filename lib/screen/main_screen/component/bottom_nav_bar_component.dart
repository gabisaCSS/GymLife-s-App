import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/main_screen/mains_bloc/mains_bloc.dart';

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
        backgroundColor: Colors.green.shade400,
        currentIndex: currentIndex,
        items: items,
        onTap: (int index) {
          context.read<MainsBloc>().add(ChangedBottomNavBarEvent(index: index));
        },
      );
    }

    return BlocBuilder<MainsBloc, MainsState>(
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
