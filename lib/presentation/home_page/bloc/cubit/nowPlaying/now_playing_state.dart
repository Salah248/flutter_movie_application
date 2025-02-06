part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingMoviesState {}

final class NowPlayingMoviesLoading extends NowPlayingMoviesState {}


final class NowPlayingMoviesLoaded extends NowPlayingMoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

final class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errMessage;

  NowPlayingMoviesFailure({required this.errMessage});
}