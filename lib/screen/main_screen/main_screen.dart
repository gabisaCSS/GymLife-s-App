import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/dashboard_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/component/bottom_nav_bar_component.dart';
import 'package:gym_lifes_app/screen/food_screen/food_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/mains_bloc/mains_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gym Life's App"),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
      ),
      body: BlocBuilder<MainsBloc, MainsState>(builder: (context, state) {
        if (state is DashboardScreenState) {
          return const DashboardScreen();
        } else if (state is FoodScreenState) {
          return const FoodScreen();
        } else {
          return const SizedBox();
        }
      }),
      bottomNavigationBar: const BottomNavigationBarComponent(),
    );
  }
}
