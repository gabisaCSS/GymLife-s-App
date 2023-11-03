import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/dot_indicator_component/cubit/dot_indicator_cubit.dart';
import 'package:gym_lifes_app/style/color_widget.dart';

class DotIndicatorComponent extends StatelessWidget {
  const DotIndicatorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DotIndicatorCubit, DotIndicatorState>(
      builder: (context, state) {
        if (state is DotIndicatorValueState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 2; i++)
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: state.currentIndex == i
                          ? ColorWidget.primaryColor
                          : Colors.grey,
                      shape: BoxShape.circle),
                )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
