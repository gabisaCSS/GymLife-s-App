import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_title_state.dart';

class RecipeTitleCubit extends Cubit<RecipeTitleState> {
  RecipeTitleCubit() : super(const RecipeTitleAmanState(titleValue: ''));

  void onChangedTitle(String value) {
    if (value.isEmpty) {
      emit(const RecipeTitleErrorState(errorMessage: 'Title cannot empty!'));
    } else {
      emit(RecipeTitleAmanState(titleValue: value));
    }
  }
}
