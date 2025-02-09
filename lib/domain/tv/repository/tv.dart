import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationsTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> getSearchTv(String query);

}