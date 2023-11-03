part of 'set_field_cubit.dart';

sealed class SetFieldState extends Equatable {
  const SetFieldState();

  @override
  List<Object> get props => [];
}

final class SetFieldInitial extends SetFieldState {
  final int initValue;

  const SetFieldInitial({required this.initValue});

  @override
  List<Object> get props => [initValue];
}

final class SetFieldAmanState extends SetFieldState {
  final int setValue;

  const SetFieldAmanState({required this.setValue});

  @override
  List<Object> get props => [setValue];
}

final class SetFieldErrorState extends SetFieldState {
  final String errorText;

  const SetFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}
