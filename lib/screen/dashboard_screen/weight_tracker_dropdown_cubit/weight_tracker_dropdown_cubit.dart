import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weight_tracker_dropdown_state.dart';

class WeightTrackerDropdownCubit extends Cubit<WeightTrackerDropdownState> {
  WeightTrackerDropdownCubit()
      : super(WeightTrackerDropdownValueState(value: 'Since Beginning'));

  void onChangedDropdown(String value) {
    emit(WeightTrackerDropdownValueState(value: value));
  }
}
