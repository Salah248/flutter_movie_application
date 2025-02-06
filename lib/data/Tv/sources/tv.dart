import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_application/core/constants/constants.dart';
import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/di.dart';

abstract class TvServices {
  Future<Either> getPopularTv();
}

class TvApiServicesImpl extends TvServices {
  @override
  Future<Either> getPopularTv() async{
   try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

