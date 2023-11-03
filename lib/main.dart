import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_lifes_app/constants/bloc_provider_widget.dart';
import 'package:gym_lifes_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviderWidget.providers,
        child: MaterialApp(
          title: "Gym Life's App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          // home: const TesScreen(),
          initialRoute: Routes.mainScreen,
          routes: Routes.routes,
        ));
  }
}
