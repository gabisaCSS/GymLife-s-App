import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weight_date_state.dart';

class WeightDateCubit extends Cubit<WeightDateState> {
  WeightDateCubit() : super(WeightDateValueState(date: DateTime.now()));

  void setDate({required DateTime selectedDate}) {
    emit(WeightDateValueState(date: selectedDate));
  }
}
