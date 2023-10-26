part of 'recipe_title_cubit.dart';

sealed class RecipeTitleState extends Equatable {
  const RecipeTitleState();

  @override
  List<Object> get props => [];
}

final class RecipeTitleInitial extends RecipeTitleState {}

final class RecipeTitleAmanState extends RecipeTitleState {
  final String titleValue;

  const RecipeTitleAmanState({required this.titleValue});

  @override
  List<Object> get props => [titleValue];
}

final class RecipeTitleErrorState extends RecipeTitleState {
  final String errorMessage;

  const RecipeTitleErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class RecipeTitleClearState extends RecipeTitleState {
  @override
  List<Object> get props => [];
}
