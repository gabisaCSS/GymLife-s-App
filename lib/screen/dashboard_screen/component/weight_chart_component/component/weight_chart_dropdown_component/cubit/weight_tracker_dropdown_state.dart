part of 'weight_tracker_dropdown_cubit.dart';

sealed class WeightTrackerDropdownState extends Equatable {
  const WeightTrackerDropdownState();

  @override
  List<Object> get props => [];
}

final class WeightTrackerDropdownInitial extends WeightTrackerDropdownState {}

final class WeightTrackerDropdownValueState extends WeightTrackerDropdownState {
  final String value;
  final List<String> items = [
    'Since Beginning',
    'Last 90 Days',
    'Last 60 Days',
    'Last 30 Days',
    'Last 2 Weeks',
    'Last 1 Week'
  ];

  WeightTrackerDropdownValueState({required this.value});

  @override
  List<Object> get props => [value];
}
