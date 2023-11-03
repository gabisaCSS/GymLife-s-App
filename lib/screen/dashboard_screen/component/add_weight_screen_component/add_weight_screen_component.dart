import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/weight_date_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_field_component/cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_field_component/weight_field_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/weight_chart_dropdown_component.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/weight_tracker_bloc/weight_tracker_bloc.dart';

class AddWeightScreenComponent extends StatelessWidget {
  const AddWeightScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Weight'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final dropdownDateState =
                context.read<WeightTrackerDropdownCubit>().state;
            if (dropdownDateState is WeightTrackerDropdownValueState) {
              WeightChartDropdownComponent.getWeightBasedTimeline(
                  context, dropdownDateState.value);
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          Builder(builder: (context) {
            final dateState = context.watch<WeightDateCubit>().state;
            final weightState = context.watch<WeightFieldCubit>().state;

            final bool isEnabled = weightState is WeightFieldAmanState &&
                dateState is WeightDateValueState;

            return IconButton(
                onPressed: isEnabled
                    ? () {
                        DateTime date = dateState.date;

                        WeightModel weightModel = WeightModel(
                            weight: double.parse(weightState.weightValue),
                            date: date);

                        context
                            .read<WeightTrackerBloc>()
                            .add(AddWeightEvent(weightModel: weightModel));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Weight Succesfuly Added!')));
                      }
                    : null,
                icon: const Icon(Icons.check));
          })
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            WeightFieldComponent(),
            Divider(),
            WeightDateComponent(),
          ],
        ),
      ),
    );
  }
}
