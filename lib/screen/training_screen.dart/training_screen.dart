import 'package:flutter/material.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/training_date_picker_bar_component.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/training_list_component.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 2,
        ),
        const TrainingDatePickerBarComponent(),
        Expanded(
          child: ListView(
            children: const [
              TrainingListComponent(),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
