import 'package:flutter/material.dart';
import 'package:flutter_movie_application/presentation/home_page/home_page_view.dart';
import 'package:flutter_movie_application/presentation/movie_details/moive_details_view.dart';
import 'package:flutter_movie_application/presentation/search_page/search_page_view.dart';
import 'package:flutter_movie_application/presentation/sign_up_page/sign_up_view.dart';
import 'package:flutter_movie_application/presentation/signin_page/sign_in_view.dart';
import 'package:flutter_movie_application/presentation/splash_page/splash_view.dart';

class Routes {

  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signIUp = '/signUp';
  static const String homePage = '/homePage';
  static const String moiveDetails = '/moiveDetails';
  static const String searchPage = '/searchPage';

}

class RouteGenrator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.signIUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePageView());
      case Routes.moiveDetails:
        return MaterialPageRoute(builder: (_) => const MoiveDetailsView());
      case Routes.searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPageView());
      default:
        return unDefinedRoute(); 
    }
  }

    static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  Text('no route found'),
        ),
        body:  Center(
          child: Text('no route found'),
        ),
      ),
    );
  }
}

