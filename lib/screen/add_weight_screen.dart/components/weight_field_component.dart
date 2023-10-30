import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/add_weight_screen.dart/weight_field_cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/widget/text_field_widget.dart';

class WeightFieldComponent extends StatelessWidget {
  const WeightFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Weight (Kg)',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
            width: 60,
            height: 40,
            child: BlocBuilder<WeightFieldCubit, WeightFieldState>(
              builder: (context, state) {
                if (state is WeightFieldInitial) {
                  return TextFieldWidget(
                      filled: false,
                      inputBorder: InputBorder.none,
                      maxLines: 1,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: '0'),
                      onChanged: (val) {
                        context
                            .read<WeightFieldCubit>()
                            .setWeightValue(weightValue: val);
                      });
                } else if (state is WeightFieldAmanState) {
                  return TextFieldWidget(
                      filled: false,
                      inputBorder: InputBorder.none,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      onChanged: (val) {
                        context
                            .read<WeightFieldCubit>()
                            .setWeightValue(weightValue: val);
                      });
                } else if (state is WeightFieldErrorState) {
                  return TextFieldWidget(
                      filled: false,
                      inputBorder: InputBorder.none,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      onChanged: (val) {
                        context
                            .read<WeightFieldCubit>()
                            .setWeightValue(weightValue: val);
                      });
                } else {
                  return const SizedBox();
                }
              },
            ))
      ],
    );
  }
}
