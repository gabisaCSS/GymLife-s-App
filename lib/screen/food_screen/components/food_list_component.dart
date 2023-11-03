import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';
import 'package:gym_lifes_app/routes/routes.dart';
import 'package:gym_lifes_app/screen/food_screen/breakfast_cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/cubit/food_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/dinner_cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/lunch_cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/style/color_widget.dart';
import 'package:gym_lifes_app/style/text_style_widget.dart';

class FoodListComponent extends StatelessWidget {
  final String title;
  final List<FoodModel> foodList;
  final double totalCalorie;
  final void Function()? onPressedAddButton;
  const FoodListComponent({
    super.key,
    required this.title,
    required this.foodList,
    this.onPressedAddButton,
    required this.totalCalorie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyleWidget.m3BodyPas(isBold: true),
                ),
                Text(
                  totalCalorie.toStringAsFixed(0),
                  style: TextStyleWidget.m3BodyPas(isBold: true),
                ),
              ],
            ),
          ),
          const Divider(),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              final food = foodList[index];
              return ListTile(
                title: Text(food.foodName),
                subtitle: Text(
                    '${food.calori.quantity.toStringAsFixed(0)} Cal, ${food.carbs.quantity.toStringAsFixed(0)}C, ${food.protein.quantity.toStringAsFixed(0)}P, ${food.fat.quantity.toStringAsFixed(0)}F'),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete Food'),
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Are you sure to delete ${food.foodName} from your $title?')
                                  ]),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<FoodCubit>()
                                        .deleteFoodById(foodId: food.foodId!);

                                    switch (food.eatTime) {
                                      case 'Breakfast':
                                        context
                                            .read<BreakfastCubit>()
                                            .getBreakfast(date: food.date);
                                        break;
                                      case 'Lunch':
                                        context
                                            .read<LunchCubit>()
                                            .getLunch(date: food.date);
                                        break;
                                      case 'Dinner':
                                        context
                                            .read<DinnerCubit>()
                                            .getDinner(date: food.date);
                                        break;
                                      default:
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.remove_outlined)),
              );
            },
          ),
          (foodList.isNotEmpty) ? const Divider() : const SizedBox(),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.recipeAnalyzerScreen,
                    arguments: title);
              },
              child: Text(
                'Add Food',
                style: TextStyleWidget.m3BodyLarge(
                  color: ColorWidget.primaryColor,
                  // isBold: true,
                ),
              ))
        ],
      ),
    );
  }
}
