import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dot_indicator_state.dart';

class DotIndicatorCubit extends Cubit<DotIndicatorState> {
  DotIndicatorCubit() : super(const DotIndicatorValueState(currentIndex: 0));

  void onChangeDot(int index) {
    emit(DotIndicatorValueState(currentIndex: index));
  }
}
