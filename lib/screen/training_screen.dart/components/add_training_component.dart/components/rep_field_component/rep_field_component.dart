import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/cubit/rep_field_cubit.dart';
import 'package:gym_lifes_app/widget/label_and_input_row.dart';

class RepFieldComponent extends StatelessWidget {
  const RepFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepFieldCubit, RepFieldState>(
      builder: (context, state) {
        if (state is RepFieldAmanState) {
          return LabelAndInputRow(
            label: 'Rep',
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<RepFieldCubit>().onChangedRep(setValue);
            },
          );
        } else if (state is RepFieldErrorState) {
          return LabelAndInputRow(
            label: 'Rep',
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<RepFieldCubit>().onChangedRep(setValue);
            },
          );
        } else if (state is RepFieldInitial) {
          return LabelAndInputRow(
            label: 'Rep',
            controller: TextEditingController(text: '${state.initValue}'),
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<RepFieldCubit>().onChangedRep(setValue);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
