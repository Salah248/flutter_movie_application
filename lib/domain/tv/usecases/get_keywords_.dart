
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/core/usecase/use_case.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/repository/tv.dart';

class GetTvKeywordsUseCase extends UseCase<Either,int> {
  @override
  Future<Either> call({int ? params}) async {
    return await sl<TvRepository>().getKeywords(params!);
  }
}