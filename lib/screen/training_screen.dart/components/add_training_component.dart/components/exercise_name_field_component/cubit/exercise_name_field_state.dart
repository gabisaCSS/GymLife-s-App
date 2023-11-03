part of 'exercise_name_field_cubit.dart';

sealed class ExerciseNameFieldState extends Equatable {
  const ExerciseNameFieldState();

  @override
  List<Object> get props => [];
}

final class ExerciseNameFieldInitial extends ExerciseNameFieldState {
  final String initValue;

  const ExerciseNameFieldInitial({required this.initValue});

  @override
  List<Object> get props => [initValue];
}

final class ExerciseNameFieldAmanState extends ExerciseNameFieldState {
  final String nameValue;

  const ExerciseNameFieldAmanState({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}

final class ExerciseNameFieldErrorState extends ExerciseNameFieldState {
  final String errorText;

  const ExerciseNameFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}
