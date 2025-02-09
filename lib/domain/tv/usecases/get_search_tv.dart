
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/core/usecase/use_case.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/repository/tv.dart';

class GetSearchTvUseCase extends UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<TvRepository>().getSearchTv(params!);
  }
}