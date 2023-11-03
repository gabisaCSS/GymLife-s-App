part of 'weight_field_cubit.dart';

sealed class WeightFieldState extends Equatable {
  const WeightFieldState();

  @override
  List<Object> get props => [];
}

final class WeightFieldInitial extends WeightFieldState {}

final class WeightFieldAmanState extends WeightFieldState {
  final String weightValue;

  const WeightFieldAmanState({required this.weightValue});

  @override
  List<Object> get props => [weightValue];
}

final class WeightFieldErrorState extends WeightFieldState {
  final String errorText;

  const WeightFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}
