import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/training_model/training_model.dart';

part 'training_chart_state.dart';

class TrainingChartCubit extends Cubit<TrainingChartState> {
  TrainingChartCubit() : super(TrainingChartInitial());

  void getTraining({required String exerciseName}) async {
    DatabaseHelper db = DatabaseHelper();

    emit(TrainingChartLoadingState());

    List<TrainingModel> trainingList =
        await db.getTrainingByExerciseName(exerciseName: exerciseName);

    print('set : ${trainingList[0].sets}');
    print('rep : ${trainingList[0].reps}');

    emit(TrainingChartLoadedState(trainingList: trainingList));
  }
}
