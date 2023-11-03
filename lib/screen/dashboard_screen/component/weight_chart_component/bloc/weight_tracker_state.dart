part of 'weight_tracker_bloc.dart';

sealed class WeightTrackerState extends Equatable {
  const WeightTrackerState();

  @override
  List<Object> get props => [];
}

final class WeightTrackerInitial extends WeightTrackerState {}

final class WeightTrackerLoadingState extends WeightTrackerLoadedState {
  WeightTrackerLoadingState() : super(points: []);
}

final class WeightTrackerEmptyState extends WeightTrackerState {}

final class WeightTrackerLoadedState extends WeightTrackerState {
  final List<WeightModel> points;

  const WeightTrackerLoadedState({required this.points});

  @override
  List<Object> get props => [points];
}

final class WeightTrackerErrorState extends WeightTrackerState {
  final String errorMessage;

  const WeightTrackerErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
