part of 'trailer_cubit.dart';

@immutable
sealed class TrailerState {}

final class TrailerMoviesLoading extends TrailerState {}

final class TrailerMoviesLoaded extends TrailerState {
  final  YoutubePlayerController youtubePlayerController;

  TrailerMoviesLoaded({required this.youtubePlayerController});
}

final class TrailerMoviesFailure extends TrailerState {
  final String errMessage;

  TrailerMoviesFailure({required this.errMessage});
}