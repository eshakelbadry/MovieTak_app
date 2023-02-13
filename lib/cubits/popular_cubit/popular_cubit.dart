import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/services/nowPlaying_movies_service.dart';
import 'package:movie_info/services/search_movies_service.dart';
import 'package:movie_info/services/topRated_movies_service.dart';
import 'package:movie_info/services/upComing_movies_service.dart';

import '../../models/movie_model.dart';
import '../../services/popular_movies_service.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(
    this._popularMoviesService,
  ) : super(PopularInitial());

  List<Movie> popularMoviesList = [];

  final PopularMoviesService _popularMoviesService;

  Future<void> getPopularMovies() async {
    // _page = page;
    try {
      emit(PopularMoviesLoading());
      popularMoviesList = await _popularMoviesService.fetchPopularMovies();

      emit(PopularMoviesSuccess());
    } catch (e) {
      emit(PopularMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}


 // Future<void> fetchNextPage() async {
  //   final nextPage = pagee + 1;
  //   fetchMovies(page: nextPage);
  // }




// Movie Screen:
// Copy code
// class MovieScreen extends StatelessWidget {
//   @


// cotinue
// override
// Widget build(BuildContext context) {
// final movieCubit = context.cubit<MovieCubit>();
// return Scaffold(
// appBar: AppBar(
// title: Text('Popular Movies'),
// ),
// body: SafeArea(
// child: Column(
// children: <Widget>[
// Expanded(
// child: CubitBuilder<MovieCubit, MovieState>(
// builder: (context, state) {
// if (state.isLoading) {
// return Center(child: CircularProgressIndicator());
// }
// if (state.error != null) {
// return Center(child: Text(state.error));
// }
// if (state.movies.isEmpty) {
// return Center(child: Text('No movies found'));
// }
// return ListView.builder(
// itemCount: state.movies.length,
// itemBuilder: (context, index) {
// final movie = state.movies[index];
// return ListTile(
// title: Text(movie.title),
// subtitle: Text(movie.releaseDate),
// leading: Image.network(movie.posterUrl),
// );
// },
// );
// },
// ),
// ),
// Container(
// height: 50,
// width: double.infinity,
// child: RaisedButton(
// onPressed: movieCubit.fetchMovies,
// child: Text('Fetch Movies'),
// ),
// ),
// ],
// ),
// ),
// );
// }
// }


