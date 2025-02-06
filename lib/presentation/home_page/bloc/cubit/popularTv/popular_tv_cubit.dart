import 'package:bloc/bloc.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/entities/tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_popular_movies.dart';
import 'package:meta/meta.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

 void getPopularTV() async {
    var returnData = await sl<GetPopularTvUseCase>().call();
    returnData.fold(
      (error) {
        emit(PopularTvFailure(errMessage: error));
      },
      (data) {
        emit(PopularTvLoaded(tv: data));
      },
    );
  }
}
