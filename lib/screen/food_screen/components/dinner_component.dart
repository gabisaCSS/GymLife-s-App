import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';

class DinnerComponent extends StatefulWidget {
  const DinnerComponent({super.key});

  @override
  State<DinnerComponent> createState() => _DinnerComponentState();
}

class _DinnerComponentState extends State<DinnerComponent> {
  @override
  void initState() {
    context.read<DinnerCubit>().getDinner(date: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: BlocBuilder<DinnerCubit, DinnerState>(
        builder: (context, state) {
          if (state is DinnerInitial) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dinner",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        state.totalCalories.toStringAsFixed(0),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.recipeAnalyzerScreen,
                          arguments: 'Dinner');
                    },
                    child: const Text('Tambah Makanan'))
              ],
            );
          } else if (state is DinnerValueState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dinner",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        state.totalCalories.toStringAsFixed(0),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: state.dinnerList.length,
                  itemBuilder: (context, index) {
                    final food = state.dinnerList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(food.foodName),
                          Text(food.calori.quantity.toStringAsFixed(0))
                        ],
                      ),
                    );
                  },
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.recipeAnalyzerScreen,
                          arguments: 'Dinner');
                    },
                    child: const Text('Tambah Makanan'))
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
