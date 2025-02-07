import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/common/bloc/cubit/generic_data_cubit.dart';
import 'package:flutter_movie_application/core/configs/assets/app_image.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_trending_movies.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          sl<GetTrendingMoviesUseCase>(),
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenericDataLoaded) {
            return Column(
              children: [
                // CarouselSlider for Images
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true, // Enable auto-play
                    enlargeCenterPage: true, // Enlarge the center item
                    viewportFraction: 0.8, // Fraction of the viewport to show
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPageIndex =
                            index; // Update the current page index
                      });
                    },
                  ),
                  items: state.data.map<Widget>((data) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white12
                                  .withValues(alpha: 200), // Shadow color
                              blurRadius: 6, // Blur radius
                              spreadRadius: 2, // Spread radius
                              offset: const Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 0, // Disable Card's default shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Match card's rounded corners
                            child: Image.network(
                              AppImages.movieImageBasePath +
                                  data.posterPath.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                // Custom Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.data.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPageIndex == index
                            ? Colors.pink // Active dot color
                            : Colors.white, // Inactive dot color
                      ),
                    ),
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
