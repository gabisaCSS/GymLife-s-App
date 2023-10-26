part of 'recipe_analyzer_bloc.dart';

sealed class RecipeAnalyzerState extends Equatable {
  const RecipeAnalyzerState();

  @override
  List<Object> get props => [];
}

final class RecipeAnalyzerInitial extends RecipeAnalyzerState {}

final class RecipeAnalyzerLoadingState extends RecipeAnalyzerState {}

final class RecipeAnalyzerErrorState extends RecipeAnalyzerState {
  final String errorMessage;

  const RecipeAnalyzerErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class RecipeAnalyzerLoadedState extends RecipeAnalyzerState {
  final NutritionModel nutritionModel;
  final String recipeTitle;

  const RecipeAnalyzerLoadedState(
      {required this.recipeTitle, required this.nutritionModel});

  @override
  List<Object> get props => [nutritionModel, recipeTitle];
}
