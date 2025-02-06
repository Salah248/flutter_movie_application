part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingMoviesLoading extends TrendingState {}

final class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;

  TrendingMoviesLoaded({required this.movies});
}

final class TrendingMoviesFailure extends TrendingState {
  final String errMessage;

  TrendingMoviesFailure({required this.errMessage});
}


