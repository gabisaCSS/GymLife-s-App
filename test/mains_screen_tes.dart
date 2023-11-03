import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_lifes_app/constants/bloc_provider_widget.dart';
import 'package:gym_lifes_app/screen/main_screen/main_screen.dart';

void main() {
  testWidgets("Harus ada judul Gym Life's App", (tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: BlocProviderWidget.providers,
      child: const MaterialApp(
        home: MainScreen(),
      ),
    ));

    expect(find.text("Gym Life's App"), findsAny);
  });
}
