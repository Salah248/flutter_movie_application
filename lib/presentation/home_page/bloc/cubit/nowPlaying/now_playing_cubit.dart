import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:meta/meta.dart';

part 'now_playing_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit() : super(NowPlayingMoviesLoading());

   void getNowPlayingMovies() async {
    var returnData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnData.fold(
      (error) {
        emit(NowPlayingMoviesFailure(errMessage: error));
      },
      (data) {
        emit(NowPlayingMoviesLoaded(movies: data));
      },
    );
  }
}
