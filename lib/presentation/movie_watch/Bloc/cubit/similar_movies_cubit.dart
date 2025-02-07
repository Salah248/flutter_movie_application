import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_similar_movies.dart';
import 'package:meta/meta.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());
void getSimilarMovies(int movieId) async {
    var returnData = await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnData.fold(
      (error) {
        emit(SimilarMoviesFailure(errMessage: error));
      },
      (data) {
        emit(SimilarMoviesLoaded(movies: data));
      },
    );
  }
}
