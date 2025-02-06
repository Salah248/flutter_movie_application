part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTvState {}

final class PopularTvLoading extends PopularTvState {}


final class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> tv;

  PopularTvLoaded({required this.tv});
}

final class PopularTvFailure extends PopularTvState {
  final String errMessage;

  PopularTvFailure({required this.errMessage});
}