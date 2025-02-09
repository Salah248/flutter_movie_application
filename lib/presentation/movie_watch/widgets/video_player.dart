import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/presentation/movie_watch/Bloc/cubit/trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailerPlayer extends StatelessWidget {
  final int id;
  const VideoTrailerPlayer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerMoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrailerMoviesLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          } else if (state is TrailerMoviesFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}