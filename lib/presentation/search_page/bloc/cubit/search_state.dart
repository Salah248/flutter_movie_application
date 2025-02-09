part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class NotSearch extends SearchState {}

final class SearchMovieLoaded extends SearchState {
  final List<MovieEntity> movies;
  SearchMovieLoaded(this.movies);
}

final class SearchTvLoaded extends SearchState {
  final List<TvEntity> tvs;
  SearchTvLoaded(this.tvs);
}

final class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure(this.errMessage);
}
