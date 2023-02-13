part of 'watch_list_cubit.dart';

@immutable
abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListFetchSuccess extends WatchListState {
  final List<Movie> movies;
  WatchListFetchSuccess(List list, {required this.movies});
}

class WatchListFetchFailure extends WatchListState {}

class WatchListAddMovieSuccess extends WatchListState {}

class WatchListAddMovieFailure extends WatchListState {}

class WatchListDeleteMovieLoading extends WatchListState {}

class WatchListDeleteMovieSuccess extends WatchListState {}

class WatchListDeleteMovieFailure extends WatchListState {}
