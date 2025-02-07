import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/widgets/movie_card.dart';
import 'package:flutter_movie_application/presentation/movie_watch/Bloc/cubit/similar_movies_cubit.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.id});
final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(id),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SimilarMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.movies[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          } else if (state is SimilarMoviesFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}