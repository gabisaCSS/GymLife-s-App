import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateValueState> {
  DateCubit()
      : super(DateValueState(currentDate: DateTime.now(), difference: 0));

  void incrementDate() {
    final DateTime currentDate = state.currentDate.add(const Duration(days: 1));

    emit(DateValueState(
        currentDate: currentDate,
        difference: calculateDifference(currentDate)));
  }

  void decrementDate() {
    final DateTime currentDate =
        state.currentDate.add(const Duration(days: -1));

    emit(DateValueState(
        currentDate: currentDate,
        difference: calculateDifference(currentDate)));
  }

  void selectDate({required DateTime selectedDate}) {
    emit(DateValueState(
        currentDate: selectedDate,
        difference: calculateDifference(selectedDate)));
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
