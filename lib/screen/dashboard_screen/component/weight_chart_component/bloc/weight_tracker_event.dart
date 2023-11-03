part of 'weight_tracker_bloc.dart';

sealed class WeightTrackerEvent extends Equatable {
  const WeightTrackerEvent();

  @override
  List<Object> get props => [];
}

final class AddWeightEvent extends WeightTrackerEvent {
  final WeightModel weightModel;

  const AddWeightEvent({required this.weightModel});

  @override
  List<Object> get props => [weightModel];
}

final class GetWeightEvent extends WeightTrackerEvent {
  final DateTime? sinceDate;

  const GetWeightEvent({this.sinceDate});
  @override
  List<Object> get props => [sinceDate ?? DateTime.now];
}
