part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchMoviesLoading extends SearchState {}

class SearchMoviesSuccess extends SearchState {
  List<Movie> searchedMoviesList;
  SearchMoviesSuccess({required this.searchedMoviesList});
}

class SearchMoviesFailure extends SearchState {
  String errMessage;
  SearchMoviesFailure({required this.errMessage});
}
