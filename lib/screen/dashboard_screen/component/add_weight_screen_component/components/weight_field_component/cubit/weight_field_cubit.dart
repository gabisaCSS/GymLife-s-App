import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weight_field_state.dart';

class WeightFieldCubit extends Cubit<WeightFieldState> {
  WeightFieldCubit() : super(WeightFieldInitial());

  void setWeightValue({required String weightValue}) {
    final RegExp regex = RegExp(r'^(0(\.\d*)?|[1-9]\d*(\.\d*)?)$');
    bool isValid = regex.hasMatch(weightValue);
    if (isValid) {
      emit(WeightFieldAmanState(weightValue: weightValue));
    } else {
      emit(const WeightFieldErrorState(errorText: ''));
    }
  }

  void clear() {
    emit(WeightFieldInitial());
  }
}
