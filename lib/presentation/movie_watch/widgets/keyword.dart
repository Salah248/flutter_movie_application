import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/bloc/cubit/generic_data_cubit.dart';
import 'package:flutter_movie_application/core/entity/keyword.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_keywords_.dart';

class TvKeywords extends StatelessWidget {
  const TvKeywords({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(sl<GetTvKeywordsUseCase>(), params: id),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenericDataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
                children: keywords
                    .map(
                      (item) => Chip(label: Text(item.name!)),
                    )
                    .toList());
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
