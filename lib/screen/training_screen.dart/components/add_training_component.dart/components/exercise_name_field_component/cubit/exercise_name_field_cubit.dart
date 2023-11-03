import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_name_field_state.dart';

class ExerciseNameFieldCubit extends Cubit<ExerciseNameFieldState> {
  ExerciseNameFieldCubit()
      : super(const ExerciseNameFieldInitial(initValue: ''));

  void onChangedExerciseName(String nameValue) {
    if (nameValue.isEmpty) {
      emit(const ExerciseNameFieldErrorState(errorText: 'Cannot Empty!'));
    } else {
      emit(ExerciseNameFieldAmanState(nameValue: nameValue));
    }
  }

  void clear() {
    emit(const ExerciseNameFieldInitial(initValue: ''));
  }

  void onEditExerciseName(String currentName) {
    emit(ExerciseNameFieldInitial(initValue: currentName));
  }
}
