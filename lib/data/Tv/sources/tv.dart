import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_application/core/constants/constants.dart';
import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/di.dart';

abstract class TvServices {
  Future<Either> getPopularTv();
   Future<Either> getRecommendationsTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
    Future<Either> getKeywords(int tvId);
  Future<Either> getSearchTv(String query);

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
  
  @override
  Future<Either> getRecommendationsTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getSimilarTv(int tvId) async {
     try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
   try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords?api_key=${ApiUrl.apiKey}',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getSearchTv(String query) async {
     try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}tv?api_key=${ApiUrl.apiKey}&query=$query',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

