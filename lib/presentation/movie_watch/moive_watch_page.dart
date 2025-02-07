import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/widgets/app_bar.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/recommendations_movies.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/similar_movies.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_overview.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_player.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_release_date.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_title.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_vote_average.dart';

class MoiveWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MoiveWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoTrailerPlayer(id: movieEntity.id!),
              SizedBox(height: 16),
              VideoTitle(title: movieEntity.title!),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                  VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
                ],
              ),
              SizedBox(height: 16),
              VideoOverview(overview: movieEntity.overview!),
              SizedBox(height: 16),
              RecommendationsMovies(id: movieEntity.id!),
              SizedBox(height: 16),
              SimilarMovies(id: movieEntity.id!),
            ],
          ),
        ),
      ),
    );
  }
}
