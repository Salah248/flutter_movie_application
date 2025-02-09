class ApiUrl {

  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiKey='f9ecb5dc2e84a7253afeb112c7138be2';

  static const trendingMovies ='trending/movie/day?api_key=$apiKey';
  static const nowPlayingMovies ='movie/now_playing?api_key=$apiKey';
  static const popularMovies ='tv/popular?api_key=$apiKey';
  static const movie ='movie/';
  static const tv ='tv/';
  static const search ='search/';
  static const trailerBase ='https://www.youtube.com/watch?v=';

}