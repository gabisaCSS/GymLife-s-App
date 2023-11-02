import 'package:flutter/material.dart';
import 'package:gym_lifes_app/model/food_model/food_model.dart';
import 'package:gym_lifes_app/routes/routes.dart';

class FoodListWidget extends StatelessWidget {
  final String title;
  final double totalCalories;
  final List<FoodModel> foodList;
  const FoodListWidget(
      {super.key,
      required this.title,
      required this.totalCalories,
      required this.foodList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  totalCalories.toStringAsFixed(0),
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
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              final food = foodList[index];
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
                    arguments: title);
              },
              child: const Text('Tambah Makanan'))
        ],
      ),
    );
  }
}
