part of 'training_weight_field_cubit.dart';

sealed class TrainingWeightFieldState extends Equatable {
  const TrainingWeightFieldState();

  @override
  List<Object> get props => [];
}

final class TrainingWeightFieldInitial extends TrainingWeightFieldState {
  final double initValue;

  const TrainingWeightFieldInitial({required this.initValue});

  @override
  List<Object> get props => [initValue];
}

final class TrainingWeightFieldAmanState extends TrainingWeightFieldState {
  final double weightValue;

  const TrainingWeightFieldAmanState({required this.weightValue});

  @override
  List<Object> get props => [weightValue];
}

final class TrainingWeightFieldErrorState extends TrainingWeightFieldState {
  final String errorText;

  const TrainingWeightFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}
