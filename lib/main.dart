import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/core/configs/themes/theme_manager.dart';
import 'package:flutter_movie_application/presentation/splash_page/bloc/cubit/splash_cubit.dart';
import 'package:flutter_movie_application/presentation/splash_page/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDi();
  runApp(const MoiveApp());
}

class MoiveApp extends StatelessWidget {
  const MoiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashView(),
      ),
    );
  }
}
