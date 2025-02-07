import 'package:dartz/dartz.dart';

abstract class MoiveRepository {
  Future<Either> getTrandingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getMovieRecommendations(int movieId);
  Future<Either> getSimilarMovies(int movieId);
}