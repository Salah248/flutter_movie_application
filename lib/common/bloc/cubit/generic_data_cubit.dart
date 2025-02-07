import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/core/usecase/use_case.dart';
import 'package:meta/meta.dart';

part 'generic_data_state.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(GenericDataLoading());
  void getData<T>(UseCase usecase,{dynamic params}) async {
    var returnData = await usecase.call(params: params);
    returnData.fold(
      (error) {
        emit(GenericDataFailure(errMessage: error));
      },
      (data) {
        emit(GenericDataLoaded<T>(data: data));
      },
    );
  }
}
