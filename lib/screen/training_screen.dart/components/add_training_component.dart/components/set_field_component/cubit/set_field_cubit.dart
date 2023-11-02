import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_field_state.dart';

class SetFieldCubit extends Cubit<SetFieldState> {
  SetFieldCubit() : super(const SetFieldInitial(initValue: 0));

  void onChangedSet(String setValue) {
    RegExp regex = RegExp(r'^(?!0)[0-9]+$');

    if (setValue.isEmpty || !(regex.hasMatch(setValue))) {
      emit(const SetFieldErrorState(errorText: ''));
    } else {
      emit(SetFieldAmanState(setValue: int.parse(setValue)));
    }
  }

  void clear() {
    emit(const SetFieldInitial(initValue: 0));
  }

  void onEditSet(int currentSet) {
    emit(SetFieldInitial(initValue: currentSet));
  }
}
