import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/widgets/movie_card.dart';
import 'package:flutter_movie_application/common/widgets/tv_card.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/search_cubit.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchMovieLoaded) {
          return GridView.builder(
            itemCount: state.movies.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is SearchTvLoaded) {
          return GridView.builder(
            itemCount: state.tvs.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return TVCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if(state is NotSearch) {
          return Center(
            child: Text(
              'Start typing to search...',
              style: TextStyle(fontSize: 16),
            ),
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Container();
      },
    );
  }
}
