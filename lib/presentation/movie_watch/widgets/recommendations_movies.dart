import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/widgets/movie_card.dart';
import 'package:flutter_movie_application/presentation/movie_watch/Bloc/cubit/movie_recommendations_cubit.dart';

class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieRecommendationsCubit()..getMovieRecommendations(id),
      child: BlocBuilder<MovieRecommendationsCubit, MovieRecommendationsState>(
        builder: (context, state) {
          if (state is MovieRecommendationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieRecommendationsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendations',
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
          } else if (state is MovieRecommendationsFailure) {
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
