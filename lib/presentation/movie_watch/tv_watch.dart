import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/widgets/app_bar.dart';
import 'package:flutter_movie_application/domain/tv/entities/tv.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/keyword.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/recommendations_tv.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/similar_tv.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_overview.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_player.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_title.dart';
import 'package:flutter_movie_application/presentation/movie_watch/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TvEntity tvEntity;
  const TvWatchPage({super.key, required this.tvEntity});

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
              VideoTrailerPlayer(id: tvEntity.id!),
              SizedBox(height: 16),
              VideoTitle(title: tvEntity.name!),
              SizedBox(height: 16),
              TvKeywords(id: tvEntity.id!),
              SizedBox(height: 16),
              VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
              SizedBox(height: 16),
              VideoOverview(overview: tvEntity.overview!),
              SizedBox(height: 16),
              RecommendationsTv(id: tvEntity.id!),
              SizedBox(height: 16),
              SimilarTv(id: tvEntity.id!),
            ],
          ),
        ),
      ),
    );
  }
}
