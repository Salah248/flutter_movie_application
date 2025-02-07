part of 'generic_data_cubit.dart';

@immutable
sealed class GenericDataState {}

final class GenericDataLoading extends GenericDataState {}


final class GenericDataLoaded<T> extends GenericDataState {
  final T data;

  GenericDataLoaded({required this.data});
}

final class GenericDataFailure extends GenericDataState {
  final String errMessage;

  GenericDataFailure({required this.errMessage});
}