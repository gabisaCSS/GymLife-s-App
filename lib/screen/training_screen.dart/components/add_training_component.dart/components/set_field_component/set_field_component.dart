import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/cubit/set_field_cubit.dart';
import 'package:gym_lifes_app/widget/label_and_input_row.dart';

class SetFieldComponent extends StatelessWidget {
  const SetFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetFieldCubit, SetFieldState>(
      builder: (context, state) {
        if (state is SetFieldAmanState) {
          return LabelAndInputRow(
            label: 'Set',
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<SetFieldCubit>().onChangedSet(setValue);
            },
          );
        } else if (state is SetFieldErrorState) {
          return LabelAndInputRow(
            label: 'Set',
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<SetFieldCubit>().onChangedSet(setValue);
            },
          );
        } else if (state is SetFieldInitial) {
          return LabelAndInputRow(
            label: 'Set',
            controller: TextEditingController(text: '${state.initValue}'),
            inputBorder: InputBorder.none,
            onChanged: (setValue) {
              context.read<SetFieldCubit>().onChangedSet(setValue);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
