part of 'training_list_cubit.dart';

sealed class TrainingListState extends Equatable {
  const TrainingListState();

  @override
  List<Object> get props => [];
}

final class TrainingListInitial extends TrainingListState {}

final class TrainingListLoadedState extends TrainingListState {
  final List<TrainingModel> trainingList;

  const TrainingListLoadedState({required this.trainingList});

  @override
  List<Object> get props => [trainingList];
}

final class TrainingListLoadingState extends TrainingListLoadedState {
  TrainingListLoadingState() : super(trainingList: []);

  @override
  List<Object> get props => [trainingList];
}
