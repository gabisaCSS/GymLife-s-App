import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/calorie_progress_counter_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/dot_indicator_component/cubit/dot_indicator_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/dot_indicator_component/dot_indicator_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/nutrition_chart_component/nutrition_chart_component.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              context.read<DotIndicatorCubit>().onChangeDot(index);
            },
            viewportFraction: 0.92,
            // height: 200,
            aspectRatio: 1.5,
            enableInfiniteScroll: false,
          ),
          items: const [
            CalorieProgressCounterComponent(),
            NutritionChartComponent(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const DotIndicatorComponent(),
      ],
    );
  }
}
