import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_date_component/cubit/weight_date_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/add_weight_screen_component/components/weight_field_component/cubit/weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/calorie_progress_counter_component/cubit/calorie_progress_counter_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/slider_component/component/dot_indicator_component/cubit/dot_indicator_cubit.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/bloc/weight_tracker_bloc.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart_component/component/weight_chart_dropdown_component/cubit/weight_tracker_dropdown_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/breakfast_component/cubit/breakfast_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/date_picker_bar_component/cubit/date_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/dinner_component/cubit/dinner_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/lunch_component/cubit/lunch_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/recipe_analyzer_screen_component/bloc/recipe_analyzer_bloc.dart';
import 'package:gym_lifes_app/screen/food_screen/components/recipe_analyzer_screen_component/component/recipe_ingr_field_component/cubit/recipe_ingr_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/components/recipe_analyzer_screen_component/component/recipe_title_field_component/cubit/recipe_title_cubit.dart';
import 'package:gym_lifes_app/screen/food_screen/cubit/food_cubit.dart';
import 'package:gym_lifes_app/screen/main_screen/bloc/mains_bloc.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/exercise_name_field_component/cubit/exercise_name_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/rep_field_component/cubit/rep_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/set_field_component/cubit/set_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/add_training_component.dart/components/training_weight_field_component/cubit/training_weight_field_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/cubit/training_chart_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_date_picker_bar_component/cubit/training_date_cubit.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_list_component/cubit/training_list_cubit.dart';

class BlocProviderWidget {
  static List<BlocProvider> providers = [
    BlocProvider<MainsBloc>(
      create: (context) => MainsBloc(),
    ),
    BlocProvider<RecipeTitleCubit>(
      create: (context) => RecipeTitleCubit(),
    ),
    BlocProvider<RecipeIngrCubit>(
      create: (context) => RecipeIngrCubit(),
    ),
    BlocProvider<FoodCubit>(
      create: (context) => FoodCubit(),
    ),
    BlocProvider<BreakfastCubit>(
      create: (context) => BreakfastCubit(),
    ),
    BlocProvider<LunchCubit>(
      create: (context) => LunchCubit(),
    ),
    BlocProvider<DinnerCubit>(
      create: (context) => DinnerCubit(),
    ),
    BlocProvider<DateCubit>(
      create: (context) => DateCubit(),
    ),
    BlocProvider<DotIndicatorCubit>(
      create: (context) => DotIndicatorCubit(),
    ),
    BlocProvider<ExerciseNameFieldCubit>(
      create: (context) => ExerciseNameFieldCubit(),
    ),
    BlocProvider<SetFieldCubit>(
      create: (context) => SetFieldCubit(),
    ),
    BlocProvider<RepFieldCubit>(
      create: (context) => RepFieldCubit(),
    ),
    BlocProvider<TrainingWeightFieldCubit>(
      create: (context) => TrainingWeightFieldCubit(),
    ),
    BlocProvider<CalorieProgressCounterCubit>(
      create: (context) => CalorieProgressCounterCubit(),
    ),
    BlocProvider<TrainingDateCubit>(
      create: (context) => TrainingDateCubit(),
    ),
    BlocProvider<TrainingListCubit>(
      create: (context) => TrainingListCubit(),
    ),
    BlocProvider<TrainingChartCubit>(
      create: (context) => TrainingChartCubit(),
    ),
    BlocProvider<WeightDateCubit>(
      create: (context) => WeightDateCubit(),
    ),
    BlocProvider<WeightTrackerDropdownCubit>(
      create: (context) => WeightTrackerDropdownCubit(),
    ),
    BlocProvider<WeightFieldCubit>(
      create: (context) => WeightFieldCubit(),
    ),
    BlocProvider<RecipeAnalyzerBloc>(
      create: (context) => RecipeAnalyzerBloc(),
    ),
    BlocProvider<WeightTrackerBloc>(
      create: (context) => WeightTrackerBloc(),
    ),
  ];
}
