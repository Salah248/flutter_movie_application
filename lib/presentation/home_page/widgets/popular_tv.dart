import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/widgets/tv_card.dart';
import 'package:flutter_movie_application/presentation/home_page/bloc/cubit/popularTv/popular_tv_cubit.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTV(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopularTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: state.tv.length,
              ),
            );
          } else if (state is PopularTvFailure) {
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
