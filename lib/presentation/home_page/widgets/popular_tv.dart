import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/bloc/cubit/generic_data_cubit.dart';
import 'package:flutter_movie_application/common/widgets/tv_card.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/entities/tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_popular_movies.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TvEntity>>(sl<GetPopularTvUseCase>(),),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenericDataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: state.data.length,
              ),
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
