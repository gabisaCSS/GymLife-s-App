import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_lifes_app/helper/database_helper.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  void deleteFoodById({required int foodId}) async {
    DatabaseHelper db = DatabaseHelper();

    await db.deleteFoodById(foodId: foodId);
  }
}
