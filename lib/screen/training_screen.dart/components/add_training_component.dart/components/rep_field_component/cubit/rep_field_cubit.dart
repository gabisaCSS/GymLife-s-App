import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rep_field_state.dart';

class RepFieldCubit extends Cubit<RepFieldState> {
  RepFieldCubit() : super(const RepFieldInitial(initValue: 0));

  void onChangedRep(String repValue) {
    RegExp regex = RegExp(r'^(?!0)[0-9]+$');

    if (repValue.isEmpty || !(regex.hasMatch(repValue))) {
      emit(const RepFieldErrorState(errorText: ''));
    } else {
      emit(RepFieldAmanState(repValue: int.parse(repValue)));
    }
  }

  void clear() {
    emit(const RepFieldInitial(initValue: 0));
  }

  void onEditRep(int currentRep) {
    emit(RepFieldInitial(initValue: currentRep));
  }
}
