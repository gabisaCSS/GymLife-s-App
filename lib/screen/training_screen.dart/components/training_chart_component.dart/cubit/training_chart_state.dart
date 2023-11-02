part of 'training_chart_cubit.dart';

sealed class TrainingChartState extends Equatable {
  const TrainingChartState();

  @override
  List<Object> get props => [];
}

final class TrainingChartInitial extends TrainingChartState {}

final class TrainingChartLoadingState extends TrainingChartState {}

final class TrainingChartLoadedState extends TrainingChartState {
  final List<TrainingModel> trainingList;

  const TrainingChartLoadedState({required this.trainingList});

  @override
  List<Object> get props => [trainingList];
}
