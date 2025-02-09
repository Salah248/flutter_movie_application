import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/bloc/cubit/generic_data_cubit.dart';
import 'package:flutter_movie_application/common/widgets/tv_card.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/entities/tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_recommendation_tv.dart';

class RecommendationsTv extends StatelessWidget {
  const RecommendationsTv({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvEntity>>(
          sl<GetRecommendationsTvUseCase>(),
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
                      return TVCard(
                        tvEntity: state.data[index],
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
