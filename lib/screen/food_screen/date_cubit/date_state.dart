part of 'date_cubit.dart';

sealed class DateState extends Equatable {
  const DateState();

  @override
  List<Object> get props => [];
}

final class DateValueState extends DateState {
  final DateTime currentDate;
  final int difference;
  // if difference == 0 then it's today, if 1 then it's tomorrow and if -1 then it's yesterday

  const DateValueState({required this.difference, required this.currentDate});

  @override
  List<Object> get props => [difference, currentDate];
}
