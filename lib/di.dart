import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/data/movie/repositories/movie.dart';
import 'package:flutter_movie_application/data/movie/sources/movie.dart';
import 'package:flutter_movie_application/domain/movie/repositories/moive.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_trending_movies.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUpDi() {
  sl.registerSingleton<DioClient>(DioClient());

// Services
sl.registerSingleton<MovieService>(MovieApiServiceImpl());

// Repositories
sl.registerSingleton<MoiveRepository>(MovieRepositoryImpl());

//  Use Cases
sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());


}

