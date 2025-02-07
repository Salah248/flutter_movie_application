import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_movie_recommendation.dart';
import 'package:meta/meta.dart';

part 'movie_recommendations_state.dart';

class MovieRecommendationsCubit extends Cubit<MovieRecommendationsState> {
  MovieRecommendationsCubit() : super(MovieRecommendationsLoading());
void getMovieRecommendations(int movieId) async {
    var returnData = await sl<GetMovieRecommendationsUseCase>().call(params: movieId);
    returnData.fold(
      (error) {
        emit(MovieRecommendationsFailure(errMessage: error));
      },
      (data) {
        emit(MovieRecommendationsLoaded(movies: data));
      },
    );
  }

}
