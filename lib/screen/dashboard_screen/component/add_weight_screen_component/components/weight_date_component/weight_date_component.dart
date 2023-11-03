import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/cubit/weight_date_cubit.dart';
import 'package:intl/intl.dart';

class WeightDateComponent extends StatelessWidget {
  const WeightDateComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Date',
          style: TextStyle(fontSize: 16),
        ),
        TextButton(onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025))
              .then((value) {
            if (value != null) {
              context.read<WeightDateCubit>().setDate(selectedDate: value);
            }
          });
        }, child: BlocBuilder<WeightDateCubit, WeightDateState>(
          builder: (context, state) {
            if (state is WeightDateValueState) {
              DateFormat formatter = DateFormat('dd-MM-yyyy');
              String dateText = formatter.format(state.date);

              return Text(dateText);
            } else {
              return const SizedBox();
            }
          },
        ))
      ],
    );
  }
}
