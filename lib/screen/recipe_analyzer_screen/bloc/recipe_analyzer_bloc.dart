import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_api/nutrition_api.dart';
import 'package:gym_lifes_app/model/nutrition_model/nutrition_model.dart';

part 'recipe_analyzer_event.dart';
part 'recipe_analyzer_state.dart';

class RecipeAnalyzerBloc
    extends Bloc<RecipeAnalyzerEvent, RecipeAnalyzerState> {
  RecipeAnalyzerBloc() : super(RecipeAnalyzerInitial()) {
    on<SubmitRecipeEvent>(_onSubmitRecipeEvent);
    on<ClearEvent>(_onClear);
  }

  void _onSubmitRecipeEvent(
      SubmitRecipeEvent event, Emitter<RecipeAnalyzerState> emit) async {
    emit(RecipeAnalyzerLoadingState());
    List<String> ingrList = event.recipeIngr.split('\n');

    try {
      NutritionModel nutritionModel = await NutritionApi.getNutrition(
          title: event.recipeTitle, ingr: ingrList);
      emit(RecipeAnalyzerLoadedState(
          recipeTitle: event.recipeTitle, nutritionModel: nutritionModel));
    } on DioException catch (e) {
      print(e.response?.statusCode);
      emit(const RecipeAnalyzerErrorState(errorMessage: 'Analyze Failed!'));
    }
  }

  void _onClear(ClearEvent event, Emitter<RecipeAnalyzerState> emit) {
    emit(RecipeAnalyzerInitial());
  }
}
