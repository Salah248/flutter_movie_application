import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/common/helper/mapper/movie.dart';
import 'package:flutter_movie_application/common/helper/mapper/trailer.dart';
import 'package:flutter_movie_application/core/models/trailers.dart';
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
  Future<Either> getNowPlayingMovies() async {
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

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        // استخراج قائمة النتائج من البيانات
        final results = data['results'] as List;

        if (results.isEmpty) {
          // في حالة عدم وجود تريلر، يمكنك إعادة رسالة خطأ مناسبة
          return Left("No trailer found for this movie.");
        }

        // استخدام أول عنصر من القائمة لتحويله إلى نموذج
        final trailerModel = TrailerModel.fromJson(results.first);
        // تحويل النموذج إلى كيان (Entity) باستخدام المابّر
        final trailerEntity = TrailerMapper.toEntity(trailerModel);

        return Right(trailerEntity);
      },
    );
  }

  @override
  Future<Either> getMovieRecommendations(int movieId) async {
    var returnedData =
        await sl<MovieService>().getMovieRecommendations(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => MovieMapper.toEntity(
              MovieModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData =
        await sl<MovieService>().getSimilarMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => MovieMapper.toEntity(
              MovieModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
}
