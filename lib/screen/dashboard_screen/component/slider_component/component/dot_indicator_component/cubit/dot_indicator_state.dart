part of 'dot_indicator_cubit.dart';

sealed class DotIndicatorState extends Equatable {
  const DotIndicatorState();

  @override
  List<Object> get props => [];
}

final class DotIndicatorInitial extends DotIndicatorState {}

final class DotIndicatorValueState extends DotIndicatorState {
  final int currentIndex;

  const DotIndicatorValueState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
