import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';

part 'weight_tracker_event.dart';
part 'weight_tracker_state.dart';

class WeightTrackerBloc extends Bloc<WeightTrackerEvent, WeightTrackerState> {
  WeightTrackerBloc() : super(WeightTrackerLoadingState()) {
    on<AddWeightEvent>(_onAddWeight);
    on<GetWeightEvent>(_onGetWeight);
  }

  void _onAddWeight(
      AddWeightEvent event, Emitter<WeightTrackerState> emit) async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    await dbHelper.insertWeight(event.weightModel);
  }

  void _onGetWeight(
      GetWeightEvent event, Emitter<WeightTrackerState> emit) async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    emit(WeightTrackerLoadingState());
    List<WeightModel> points =
        await dbHelper.getWeight(sinceDate: event.sinceDate);

    emit(WeightTrackerLoadedState(points: points));
  }
}
