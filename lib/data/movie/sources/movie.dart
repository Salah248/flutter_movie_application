import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_application/core/constants/constants.dart';
import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/di.dart';

abstract class MovieService {
  Future<Either> getTrandingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getMovieRecommendations(int movieId);
  Future<Either> getSimilarMovies(int movieId);

  
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrandingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getNowPlayingMovies() async{
     try {
      var response = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getMovieTrailer(int movieId) async{
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/videos?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getMovieRecommendations(int movieId) async{
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/recommendations?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getSimilarMovies(int movieId) async {
 try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/similar?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  
}
