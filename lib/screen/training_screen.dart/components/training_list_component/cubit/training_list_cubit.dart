import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';
import 'package:gym_lifes_app/model/training_model/training_model.dart';

part 'training_list_state.dart';

class TrainingListCubit extends Cubit<TrainingListLoadedState> {
  TrainingListCubit() : super(const TrainingListLoadedState(trainingList: []));

  void addTraining({required TrainingModel trainingModel}) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    await dbHelper.insertTraining(trainingModel);

    List<TrainingModel> trainingList =
        await dbHelper.getTrainingDaily(date: trainingModel.date);

    emit(TrainingListLoadedState(trainingList: trainingList));
  }

  void editTraining({required TrainingModel trainingModel}) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    await dbHelper.editTraining(trainingModel);

    List<TrainingModel> trainingList =
        await dbHelper.getTrainingDaily(date: trainingModel.date);

    emit(TrainingListLoadedState(trainingList: trainingList));
  }

  void deleteTraining({required TrainingModel trainingModel}) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    await dbHelper.deleteTraining(trainingId: trainingModel.id ?? 0);

    List<TrainingModel> trainingList =
        await dbHelper.getTrainingDaily(date: trainingModel.date);

    emit(TrainingListLoadedState(trainingList: trainingList));
  }

  // void getTraining({required DateTime date}) async {
  //   DatabaseHelper dbHelper = DatabaseHelper();
  //   emit(TrainingListLoadingState());

  //   List<TrainingModel> trainingList =
  //       await dbHelper.getTrainingDaily(date: date);

  //   emit(TrainingListLoadedState(trainingList: trainingList));
  // }

  void getTrainingDaily({required DateTime date}) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    emit(TrainingListLoadingState());

    List<TrainingModel> trainingList =
        await dbHelper.getTrainingDaily(date: date);

    emit(TrainingListLoadedState(trainingList: trainingList));
  }
}
