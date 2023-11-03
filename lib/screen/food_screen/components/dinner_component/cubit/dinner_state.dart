part of 'dinner_cubit.dart';

sealed class DinnerState extends Equatable {
  const DinnerState();

  @override
  List<Object> get props => [];
}

final class DinnerInitial extends DinnerValueState {
  DinnerInitial()
      : super(
            dinnerList: [],
            totalCalories: 0,
            totalCarbs: 0,
            totalFat: 0,
            totalFiber: 0,
            totalProtein: 0,
            totalSugar: 0);

  @override
  List<Object> get props => [dinnerList, totalCalories];
}

final class DinnerValueState extends DinnerState {
  final List<FoodModel> dinnerList;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFiber;
  final double totalFat;
  final double totalSugar;

  const DinnerValueState(
      {required this.totalProtein,
      required this.totalCarbs,
      required this.totalFiber,
      required this.totalFat,
      required this.totalSugar,
      required this.totalCalories,
      required this.dinnerList});

  @override
  List<Object> get props => [
        dinnerList,
        totalCalories,
        totalCarbs,
        totalFat,
        totalProtein,
        totalFiber,
        totalSugar
      ];
}
