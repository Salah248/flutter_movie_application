import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_application/core/constants/constants.dart';
import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/di.dart';

abstract class MovieService {
  Future<Either> getTrandingMovies();
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
}
