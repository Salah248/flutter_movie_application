import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/widgets/app_bar.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/search_cubit.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/selectable_option_cubit.dart';
import 'package:flutter_movie_application/presentation/search_page/widgets/search_content.dart';
import 'package:flutter_movie_application/presentation/search_page/widgets/search_field.dart';
import 'package:flutter_movie_application/presentation/search_page/widgets/search_options.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SearchField(),
              SizedBox(
                height: 16,
              ),
              SearchOptions(),
              SizedBox(
                height: 16,
              ),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
