import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/widgets/app_bar.dart';
import 'package:flutter_movie_application/presentation/home_page/widgets/now_playing_movies.dart';
import 'package:flutter_movie_application/presentation/home_page/widgets/popular_tv.dart';
import 'package:flutter_movie_application/presentation/home_page/widgets/trending.dart';
import 'package:flutter_movie_application/presentation/home_page/widgets/category_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset('assets/vectors/logo.svg'),
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trending 🔥',),
            TrendingMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(title: 'Now Playing ✨',),
             SizedBox(
              height: 16,
            ),
            NowPlayingMovies(),
             SizedBox(
              height: 16,
            ),
            CategoryText(title: 'Popular TV 🌟'),
            SizedBox(
              height: 16,
            ),
           PopularTv(),
           SizedBox(
              height: 16,
            ),
          ]
        ),
      ),
    );
  }
}