part of 'training_date_cubit.dart';

sealed class TrainingDateState extends Equatable {
  const TrainingDateState();

  @override
  List<Object> get props => [];
}

final class TrainingDateInitial extends TrainingDateState {}

final class TrainingDateValueState extends TrainingDateState {
  final DateTime currentDate;
  final int difference;

  const TrainingDateValueState(
      {required this.currentDate, required this.difference});

  @override
  List<Object> get props => [currentDate, difference];
}
