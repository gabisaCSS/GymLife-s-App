import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/dashboard_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/component/bottom_nav_bar_component.dart';
import 'package:gym_lifes_app/screen/food_screen/food_screen.dart';
import 'package:gym_lifes_app/screen/main_screen/mains_bloc/mains_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/training_screen.dart';
import 'package:gym_lifes_app/style/color_widget.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainsBloc, MainsState>(
      builder: (context, state) {
        if (state is DashboardScreenState) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  "Gym Life's App",
                  style:
                      TextStyleWidget.m3Title(color: ColorWidget.primaryColor),
                ),
                centerTitle: true,
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white),
            body: const DashboardScreen(),
            bottomNavigationBar: const BottomNavigationBarComponent(),
          );
        } else if (state is FoodScreenState) {
          return Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                          title: Text(
                            "Gym Life's App",
                            style: TextStyleWidget.m3Title(
                                color: ColorWidget.primaryColor),
                          ),
                          centerTitle: true,
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white)
                    ],
                body: const FoodScreen()),
            bottomNavigationBar: const BottomNavigationBarComponent(),
            backgroundColor: Colors.grey.shade100,
          );
        } else if (state is TrainingScreenState) {
          return Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                          title: Text(
                            "Gym Life's App",
                            style: TextStyleWidget.m3Title(
                                color: ColorWidget.primaryColor),
                          ),
                          centerTitle: true,
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white)
                    ],
                body: const TrainingScreen()),
            bottomNavigationBar: const BottomNavigationBarComponent(),
            backgroundColor: Colors.grey.shade100,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
