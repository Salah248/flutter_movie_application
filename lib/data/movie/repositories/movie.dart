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
        return Left(error.toString());
      },
      (data) {
        // Convert results to List
        final results = data['results'] as List;

        if (results.isEmpty) {
          // If no trailer found, return an error message
          return Left("No trailer found for this movie.");
        }
        
        // Use the first result that matches your criteria (e.g., type "Trailer")
        final trailerJson = results.firstWhere(
          (item) => item['type'] == 'Trailer',
          orElse: () => null,
        );

        if (trailerJson == null) {
          return Left("No trailer of type 'Trailer' found for this movie.");
        }

        // Create the trailer model from the JSON
        final trailerModel = TrailerModel.fromJson(trailerJson);
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
  
  @override
  Future<Either> getSearchMovie(String query) async {
       var returnedData =
        await sl<MovieService>().getSearchMovie(query);
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
