import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/bloc/cubit/generic_data_cubit.dart';
import 'package:flutter_movie_application/common/widgets/movie_card.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_similar_movies.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          sl<GetSimilarMoviesUseCase>(),
          params: id,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenericDataLoaded) {
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
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          } else if (state is GenericDataFailure) {
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
