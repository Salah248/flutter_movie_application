import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/common/helper/mapper/keyword.dart';
import 'package:flutter_movie_application/common/helper/mapper/tv.dart';
import 'package:flutter_movie_application/core/models/keyword.dart';
import 'package:flutter_movie_application/data/Tv/models/tv.dart';
import 'package:flutter_movie_application/data/Tv/sources/tv.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/repository/tv.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv()async {
    var returnData = await sl<TvServices>().getPopularTv();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => TvMapper.toEntity(
                TvModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }
  
  @override
  Future<Either> getRecommendationsTv(int tvId) async {
    var returnedData =
        await sl<TvServices>().getRecommendationsTv(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => TvMapper.toEntity(
              TvModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> getSimilarTv(int tvId) async {
       var returnedData =
        await sl<TvServices>().getSimilarTv(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => TvMapper.toEntity(
              TvModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
     var returnedData =
        await sl<TvServices>().getKeywords(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => KeywordMapper.toEntity(
              KeywordModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> getSearchTv(String query) async {
    var returnedData =
        await sl<TvServices>().getSearchTv(query);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map(
            (item) => TvMapper.toEntity(
              TvModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }
  
}

 