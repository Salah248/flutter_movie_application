import 'package:dartz/dartz.dart';
import 'package:flutter_movie_application/common/helper/mapper/tv.dart';
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
  
}

 