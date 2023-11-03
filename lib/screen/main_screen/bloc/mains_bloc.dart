import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mains_event.dart';
part 'mains_state.dart';

class MainsBloc extends Bloc<MainsEvent, MainsState> {
  MainsBloc() : super(const DashboardScreenState(index: 0)) {
    on<ChangedBottomNavBarEvent>(_onChangedBottomNavBar);
  }
  void _onChangedBottomNavBar(
      ChangedBottomNavBarEvent event, Emitter<MainsState> emit) {
    final int index = event.index;
    if (index == 0) {
      emit(DashboardScreenState(index: index));
    } else if (index == 1) {
      emit(FoodScreenState(index: index));
    } else if (index == 2) {
      emit(TrainingScreenState(index: index));
    } else {
      emit(DashboardScreenState(index: index));
    }
  }
}
