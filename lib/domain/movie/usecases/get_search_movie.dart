import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/core/usecase/use_case.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/repositories/moive.dart';

class GetSearchMovieUseCase extends UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<MoiveRepository>().getSearchMovie(params!);
  }
}