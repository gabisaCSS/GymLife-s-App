part of 'calorie_progress_counter_cubit.dart';

sealed class CalorieProgressCounterState extends Equatable {
  const CalorieProgressCounterState();

  @override
  List<Object> get props => [];
}

final class CalorieProgressCounterInitial extends CalorieProgressCounterState {}

final class CalorieProgressCounterValueState
    extends CalorieProgressCounterState {
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFiber;
  final double totalFat;
  final double totalSugar;

  const CalorieProgressCounterValueState({
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFiber,
    required this.totalFat,
    required this.totalSugar,
  });

  @override
  List<Object> get props => [
        totalCalories,
        totalCarbs,
        totalFat,
        totalProtein,
        totalFiber,
        totalSugar
      ];
}
