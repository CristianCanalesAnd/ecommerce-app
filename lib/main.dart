import 'package:ecommerce_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppStateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: buildThemeData(),
        home: const SplashScreen(),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
