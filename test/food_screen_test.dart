import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_lifes_app/constants/bloc_provider_widget.dart';
import 'package:gym_lifes_app/screen/food_screen/components/recipe_analyzer_screen_component/recipe_analyzer_screen_component.dart';

void main() {
  testWidgets('Harus ada tulisan Recipe Analyzer', (tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: BlocProviderWidget.providers,
      child: const MaterialApp(
        home: RecipeAnalyzerScreenComponent(),
      ),
    ));

    expect(find.text('Recipe Analyzer'), findsAny);
  });
}
