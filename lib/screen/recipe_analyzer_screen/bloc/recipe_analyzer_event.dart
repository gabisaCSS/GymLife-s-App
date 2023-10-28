part of 'recipe_analyzer_bloc.dart';

sealed class RecipeAnalyzerEvent extends Equatable {
  const RecipeAnalyzerEvent();

  @override
  List<Object> get props => [];
}

final class SubmitRecipeEvent extends RecipeAnalyzerEvent {
  final String recipeTitle;
  final String recipeIngr;
  final DateTime date;

  const SubmitRecipeEvent(
      {required this.recipeTitle,
      required this.recipeIngr,
      required this.date});

  @override
  List<Object> get props => [recipeTitle, recipeIngr, date];
}

final class ClearEvent extends RecipeAnalyzerEvent {
  @override
  List<Object> get props => [];
}
