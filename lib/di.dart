import 'package:flutter_movie_application/core/network/dio_clinet.dart';
import 'package:flutter_movie_application/data/Tv/repositories/tv.dart';
import 'package:flutter_movie_application/data/Tv/sources/tv.dart';
import 'package:flutter_movie_application/data/movie/repositories/movie.dart';
import 'package:flutter_movie_application/data/movie/sources/movie.dart';
import 'package:flutter_movie_application/domain/movie/repositories/moive.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_movie_recommendation.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_movie_trailer.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_search_movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_similar_movies.dart';
import 'package:flutter_movie_application/domain/tv/repository/tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_keywords_.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_popular_movies.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_search_tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_similar_tv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUpDi() {
  sl.registerSingleton<DioClient>(DioClient());

// Services
sl.registerSingleton<MovieService>(MovieApiServiceImpl());
sl.registerSingleton<TvServices>(TvApiServicesImpl());

// Repositories
sl.registerSingleton<MoiveRepository>(MovieRepositoryImpl());
sl.registerSingleton<TvRepository>(TvRepositoryImpl());

//  Use Cases
sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
sl.registerSingleton<GetRecommendationsTvUseCase>(GetRecommendationsTvUseCase());
sl.registerSingleton<GetSimilarTvUseCase>(GetSimilarTvUseCase());
sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
sl.registerSingleton<GetMovieRecommendationsUseCase>(GetMovieRecommendationsUseCase());
sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
sl.registerSingleton<GetTvKeywordsUseCase>(GetTvKeywordsUseCase());
sl.registerSingleton<GetSearchMovieUseCase>(GetSearchMovieUseCase());
sl.registerSingleton<GetSearchTvUseCase>(GetSearchTvUseCase());



}

