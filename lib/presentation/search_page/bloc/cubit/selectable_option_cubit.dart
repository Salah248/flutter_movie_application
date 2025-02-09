import 'package:bloc/bloc.dart';


enum SearchType { movie, tv }


class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.movie);

  void selectMovie() => emit(SearchType.movie);
  void selectTv() => emit(SearchType.tv);
}
