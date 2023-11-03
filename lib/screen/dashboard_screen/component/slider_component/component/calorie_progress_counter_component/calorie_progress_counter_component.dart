import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/cubit/calorie_progress_counter_cubit.dart';
import 'package:gym_lifes_app/style/box_decoration_style.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CalorieProgressCounterComponent extends StatelessWidget {
  const CalorieProgressCounterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      decoration: BoxDecorationStyle.basicBox,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Calories', style: TextStyleWidget.m3Header2()),
            Text(
              'Left = Target - Food',
              style: TextStyleWidget.m3BodySmall(),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<CalorieProgressCounterCubit,
                CalorieProgressCounterState>(
              builder: (context, state) {
                if (state is CalorieProgressCounterValueState) {
                  const double target = 2032;
                  final double left = target - state.totalCalories;
                  double percent = state.totalCalories / target;

                  if (percent > 1) {
                    percent = 1;
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                        backgroundColor: Colors.grey.shade200,
                        radius: 60.0,
                        lineWidth: 12.0,
                        animation: true,
                        animationDuration: 1500,
                        percent: percent,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              left.toStringAsFixed(0),
                              style: TextStyleWidget.m3Header1(),
                            ),
                            Text(
                              "Left",
                              style: TextStyleWidget.smallLabel(isMild: true),
                            ),
                          ],
                        ),
                        progressColor: const Color.fromARGB(255, 0, 110, 255),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.flag,
                                size: 35,
                                color: Colors.grey.shade700,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Target',
                                    style: TextStyleWidget.m3BodyMedium(),
                                  ),
                                  Text(
                                    target.toStringAsFixed(0),
                                    style: TextStyleWidget.mediumLabel(
                                        isBold: true),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Icon(Icons.egg_alt_outlined,
                                  size: 35, color: Colors.yellow.shade700),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Food',
                                    style: TextStyleWidget.m3BodyMedium(),
                                  ),
                                  Text(
                                    state.totalCalories.toStringAsFixed(0),
                                    style: TextStyleWidget.mediumLabel(
                                        isBold: true),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
