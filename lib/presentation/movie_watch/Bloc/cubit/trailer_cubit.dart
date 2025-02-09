import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_movie_trailer.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerMoviesLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(TrailerMoviesFailure(errMessage: error.toString()));
      },
      (data) async {
        if (data.key == null || data.key!.isEmpty) {
          emit(TrailerMoviesFailure(errMessage: "Trailer not available."));
          return;
        }
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: data.key!, // Now safe to use !
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
        emit(TrailerMoviesLoaded(youtubePlayerController: controller));
      },
    );
  }
}