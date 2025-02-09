import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/search_cubit.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/selectable_option_cubit.dart';
import 'package:flutter_movie_application/presentation/search_page/widgets/selectable_options.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOptions(
                title: 'Movie',
                isSealcted: context.read<SelectableOptionCubit>().state ==
                    SearchType.movie,
                onTap: () {
                  context.read<SelectableOptionCubit>().selectMovie();
                  context.read<SearchCubit>().search(
                        context.read<SearchCubit>().textEditingController.text,
                        context.read<SelectableOptionCubit>().state,
                      );
                }),
            SizedBox(
              width: 16,
            ),
            SelectableOptions(
              title: 'Tv',
              isSealcted:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: ()  {
                  context.read<SelectableOptionCubit>().selectTv();
                  context.read<SearchCubit>().search(
                        context.read<SearchCubit>().textEditingController.text,
                        context.read<SelectableOptionCubit>().state,
                      );
                },
            )
          ],
        );
      },
    );
  }
}
