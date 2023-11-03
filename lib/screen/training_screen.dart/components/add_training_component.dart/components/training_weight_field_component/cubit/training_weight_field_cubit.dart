import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'training_weight_field_state.dart';

class TrainingWeightFieldCubit extends Cubit<TrainingWeightFieldState> {
  TrainingWeightFieldCubit()
      : super(const TrainingWeightFieldInitial(initValue: 0));

  void onChangedTrainingWeight(String weightValue) {
    final RegExp regex = RegExp(r'^(0(\.\d*)?|[1-9]\d*(\.\d*)?)$');

    if (weightValue.isEmpty || !(regex.hasMatch(weightValue))) {
      emit(const TrainingWeightFieldErrorState(errorText: ''));
    } else {
      emit(
          TrainingWeightFieldAmanState(weightValue: double.parse(weightValue)));
    }
  }

  void clear() {
    emit(const TrainingWeightFieldInitial(initValue: 0));
  }

  void onEditTrainingWeight(double currentWeight) {
    emit(TrainingWeightFieldInitial(initValue: currentWeight));
  }
}
