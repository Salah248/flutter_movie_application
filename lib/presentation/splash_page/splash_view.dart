import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_application/presentation/home_page/home_page_view.dart';
import 'package:flutter_movie_application/presentation/signin_page/sign_in_view.dart';
import 'package:flutter_movie_application/presentation/splash_page/bloc/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
         if(state is UnAuthenticated){
          AppNavigator.pushReplacement(context, HomePageView());
          
         }else{
          AppNavigator.pushReplacement(context, SignInView());

         }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash-bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1A1B20).withValues(alpha: 0),
                    Color(0xff1A1B20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
