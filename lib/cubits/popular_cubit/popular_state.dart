part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

//get popular movies states
class PopularMoviesLoading extends PopularState {}

class PopularMoviesSuccess extends PopularState {}

class PopularMoviesFailure extends PopularState {
  String errMessage;
  PopularMoviesFailure({required this.errMessage});
}

//////////////////////////////////////////////
//get searched movies states
// class MovieSearchLoading extends PopularState {}

// class MovieSearchSuccess extends PopularState {
//   List<Movie> searchmoviesList;
//   MovieSearchSuccess({required this.searchmoviesList});
// }

// class MovieSearchFailure extends PopularState {
//   String errSearchMessage;
//   MovieSearchFailure({required this.errSearchMessage});
// }

// class MovieState {
//   final bool isLoading;
//   final List<Movie> movies;
//   final String error;

//   MovieState(
//       {required this.isLoading, required this.movies, required this.error});

//   factory MovieState.initial() {
//     return MovieState(isLoading: false, movies: const [], error: '');
//   }

//   MovieState copyWith(
//       {bool isLoading = false,
//       List<Movie> movies = const [],
//       String error = ''}) {
//     return MovieState(
//       isLoading: isLoading ?? this.isLoading,
//       movies: movies ?? this.movies,
//       error: error ?? this.error,
//     );
//   }
// }
