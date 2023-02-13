import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/movie_details.dart';
import '../../models/movie_model.dart';
import '../../services/movies_details.dart';

part 'details_movies_state.dart';

class DetailsMoviesCubit extends Cubit<DetailsMoviesState> {
  DetailsMoviesCubit(this._detailsMoviesService)
      : super(DetailsMoviesInitial());

  MovieDetails? detailsMovies;
  List<Genres> genresList = [];
  final DetailsMoviesService _detailsMoviesService;

  Future<void> getDetailsMovies({required int id}) async {
    try {
      emit(DetailsMoviesLoading());
      detailsMovies = await _detailsMoviesService.fetchDetailsMovies(id: id);
      // nowPlayingDetails = Movie(id: id);
      // print(detailsMovies);
      // print('object');
      emit(DetailsMoviesSuccess());
    } catch (e) {
      emit(DetailsMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }

  Future<void> getGenresMovies({required int id}) async {
    try {
      emit(DetailsMoviesLoading());
      genresList = (await _detailsMoviesService.fetchGenresMovies(id: id))!;
      // nowPlayingDetails = Movie(id: id);
      // print(detailsMovies);
      // print('object');
      emit(DetailsMoviesSuccess());
    } catch (e) {
      emit(DetailsMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
