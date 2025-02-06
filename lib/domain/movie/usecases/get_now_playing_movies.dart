
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/core/usecase/use_case.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/repositories/moive.dart';

class GetNowPlayingMoviesUseCase extends UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MoiveRepository>().getNowPlayingMovies();
  }
}