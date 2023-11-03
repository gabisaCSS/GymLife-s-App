part of 'rep_field_cubit.dart';

sealed class RepFieldState extends Equatable {
  const RepFieldState();

  @override
  List<Object> get props => [];
}

final class RepFieldInitial extends RepFieldState {
  final int initValue;

  const RepFieldInitial({required this.initValue});

  @override
  List<Object> get props => [initValue];
}

final class RepFieldAmanState extends RepFieldState {
  final int repValue;

  const RepFieldAmanState({required this.repValue});

  @override
  List<Object> get props => [repValue];
}

final class RepFieldErrorState extends RepFieldState {
  final String errorText;

  const RepFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}
