import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/di.dart';
import 'package:flutter_movie_application/domain/movie/entities/movie.dart';
import 'package:flutter_movie_application/domain/movie/usecases/get_search_movie.dart';
import 'package:flutter_movie_application/domain/tv/entities/tv.dart';
import 'package:flutter_movie_application/domain/tv/usecases/get_search_tv.dart';
import 'package:flutter_movie_application/presentation/search_page/bloc/cubit/selectable_option_cubit.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController textEditingController = TextEditingController();
   Timer? _debounce;

  void search(String query, SearchType searchType) {
 // إلغاء المؤقت السابق إذا كان موجوداً
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // تعيين مؤقت جديد لمدة 500 مللي ثانية
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // إذا كان النص فارغاً، يتم إصدار حالة NotSearch
      if (query.isEmpty) {
        emit(NotSearch());
        return;
      }
      
      // البدء بعملية البحث
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTv(query);
          break;
      }
    }); 
  }

  void searchMovie(String query) async {
    var returnedData = await sl<GetSearchMovieUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailure(error));
      },
      (data) {
        emit(SearchMovieLoaded(data));
      },
    );
  }

  void searchTv(String query) async {
    var returnedData = await sl<GetSearchTvUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailure(error));
      },
      (data) {
        emit(SearchTvLoaded(data));
      },
    );
  }
}
