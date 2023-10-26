import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_ingr_state.dart';

class RecipeIngrCubit extends Cubit<RecipeIngrState> {
  RecipeIngrCubit() : super(const RecipeIngrAmanState(ingrValue: ''));

  void onChangedIngr(String value) {
    if (value.isEmpty) {
      emit(const RecipeIngrErrorState(
          errorMessage: 'Ingridients cannot empty!'));
    } else {
      emit(RecipeIngrAmanState(ingrValue: value));
    }
  }

  void clear() {
    emit(const RecipeIngrAmanState(ingrValue: ''));
  }
}
