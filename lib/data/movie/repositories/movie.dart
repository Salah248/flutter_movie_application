import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/common/helper/mapper/movie.dart';
import 'package:flutter_movie_application/data/movie/models/movie.dart';
import 'package:flutter_movie_application/data/movie/sources/movie.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/repositories/moive.dart';

class MovieRepositoryImpl extends MoiveRepository {
  @override
  Future<Either> getTrandingMovies() async {
    var returnData = await sl<MovieService>().getTrandingMovies();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }
  
  @override
  Future<Either> getNowPlayingMovies()  async{
        var returnData = await sl<MovieService>().getNowPlayingMovies();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }
  
 
}
