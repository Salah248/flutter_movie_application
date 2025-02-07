part of 'similar_movies_cubit.dart';

@immutable
sealed class SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movies;

  SimilarMoviesLoaded({required this.movies});
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errMessage;

  SimilarMoviesFailure({required this.errMessage});
}