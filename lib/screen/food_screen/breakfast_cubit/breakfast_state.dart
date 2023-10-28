part of 'breakfast_cubit.dart';

sealed class BreakfastState extends Equatable {
  const BreakfastState();

  @override
  List<Object> get props => [];
}

final class BreakfastValueState extends BreakfastState {
  final List<FoodModel> breakfastList;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFiber;
  final double totalFat;
  final double totalSugar;

  const BreakfastValueState(
      {required this.totalProtein,
      required this.totalCarbs,
      required this.totalFiber,
      required this.totalFat,
      required this.totalSugar,
      required this.totalCalories,
      required this.breakfastList});

  @override
  List<Object> get props => [
        breakfastList,
        totalCalories,
        totalCarbs,
        totalFat,
        totalProtein,
        totalFiber,
        totalSugar
      ];
}

final class BreakfastInitial extends BreakfastValueState {
  BreakfastInitial()
      : super(
            breakfastList: [],
            totalCalories: 0,
            totalCarbs: 0,
            totalFat: 0,
            totalFiber: 0,
            totalProtein: 0,
            totalSugar: 0);

  @override
  List<Object> get props => [breakfastList, totalCalories];
}
