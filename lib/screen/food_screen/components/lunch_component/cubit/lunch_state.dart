part of 'lunch_cubit.dart';

sealed class LunchState extends Equatable {
  const LunchState();

  @override
  List<Object> get props => [];
}

final class LunchInitial extends LunchValueState {
  LunchInitial()
      : super(
            lunchList: [],
            totalCalories: 0,
            totalCarbs: 0,
            totalFat: 0,
            totalFiber: 0,
            totalProtein: 0,
            totalSugar: 0);

  @override
  List<Object> get props => [lunchList, totalCalories];
}

final class LunchValueState extends LunchState {
  final List<FoodModel> lunchList;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFiber;
  final double totalFat;
  final double totalSugar;

  const LunchValueState(
      {required this.totalProtein,
      required this.totalCarbs,
      required this.totalFiber,
      required this.totalFat,
      required this.totalSugar,
      required this.totalCalories,
      required this.lunchList});

  @override
  List<Object> get props => [
        lunchList,
        totalCalories,
        totalCarbs,
        totalFat,
        totalProtein,
        totalFiber,
        totalSugar
      ];
}
