part of 'recipe_ingr_cubit.dart';

sealed class RecipeIngrState extends Equatable {
  const RecipeIngrState();

  @override
  List<Object> get props => [];
}

final class RecipeIngrInitial extends RecipeIngrState {}

final class RecipeIngrErrorState extends RecipeIngrState {
  final String errorMessage;

  const RecipeIngrErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class RecipeIngrAmanState extends RecipeIngrState {
  final String ingrValue;

  const RecipeIngrAmanState({required this.ingrValue});

  @override
  List<Object> get props => [ingrValue];
}

final class RecipeIngrClearState extends RecipeIngrState {
  @override
  List<Object> get props => [];
}
