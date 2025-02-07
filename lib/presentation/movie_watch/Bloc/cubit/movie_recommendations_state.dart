part of 'movie_recommendations_cubit.dart';

@immutable
sealed class MovieRecommendationsState {}

final class MovieRecommendationsLoading extends MovieRecommendationsState {}

final class MovieRecommendationsLoaded extends MovieRecommendationsState {
  final List<MovieEntity> movies;

  MovieRecommendationsLoaded({required this.movies});
}

final class MovieRecommendationsFailure extends MovieRecommendationsState {
  final String errMessage;

  MovieRecommendationsFailure({required this.errMessage});
}


