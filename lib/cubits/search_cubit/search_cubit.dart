import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../models/movie_model.dart';
import '../../services/search_movies_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchMoviesService) : super(SearchInitial());
  List<Movie> searchedMoviesList = [];
  final SearchMoviesService _searchMoviesService;

  Future<void> getSearchedMovies({required String movieName}) async {
    try {
      searchedMoviesList.clear();
      emit(SearchMoviesLoading());

      searchedMoviesList =
          await _searchMoviesService.fetchSearchedMovies(movieName: movieName);

      emit(SearchMoviesSuccess(searchedMoviesList: searchedMoviesList));
    } catch (e) {
      emit(SearchMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }

  void clearSearchResults() {
    searchedMoviesList.clear();
    emit(SearchInitial());
  }
}
