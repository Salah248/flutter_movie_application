import 'package:dartz/dartz.dart';

abstract class MoiveRepository {
  Future<Either> getTrandingMovies();
  Future<Either> getNowPlayingMovies();
}