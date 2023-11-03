part of 'weight_date_cubit.dart';

sealed class WeightDateState extends Equatable {
  const WeightDateState();

  @override
  List<Object> get props => [];
}

final class WeightDateInitial extends WeightDateState {}

final class WeightDateValueState extends WeightDateState {
  final DateTime date;

  const WeightDateValueState({required this.date});
  @override
  List<Object> get props => [date];
}
