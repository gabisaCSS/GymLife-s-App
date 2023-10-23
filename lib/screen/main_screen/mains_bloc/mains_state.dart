part of 'mains_bloc.dart';

sealed class MainsState extends Equatable {
  const MainsState();

  @override
  List<Object> get props => [];
}

final class DashboardScreenState extends MainsState {
  final int index;

  const DashboardScreenState({required this.index});

  @override
  List<Object> get props => [index];
}

final class TrainingScreenState extends MainsState {
  final int index;

  const TrainingScreenState({required this.index});

  @override
  List<Object> get props => [index];
}

final class FoodScreenState extends MainsState {
  final int index;

  const FoodScreenState({required this.index});

  @override
  List<Object> get props => [index];
}
