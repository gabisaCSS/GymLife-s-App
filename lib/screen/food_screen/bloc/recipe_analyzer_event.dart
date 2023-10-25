part of 'recipe_analyzer_bloc.dart';

sealed class RecipeAnalyzerEvent extends Equatable {
  const RecipeAnalyzerEvent();

  @override
  List<Object> get props => [];
}

final class SubmitRecipeEvent extends RecipeAnalyzerEvent {
  final String recipeTitle;
  final String recipeIngr;

  const SubmitRecipeEvent(
      {required this.recipeTitle, required this.recipeIngr});

  @override
  List<Object> get props => [recipeTitle, recipeIngr];
}
