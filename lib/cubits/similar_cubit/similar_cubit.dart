import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/movie_model.dart';
import '../../services/similar_movies_service.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this._similarMoviesService) : super(SimilarInitial());

  List<Movie> similarMoviesList = [];
  final SimilarMoviesService _similarMoviesService;

  Future<void> getSimilarMovies({required int id}) async {
    try {
      emit(SimilarMoviesLoading());
      similarMoviesList =
          await _similarMoviesService.fetchSimilarMovies(id: id);
      // print(nowPlayingMoviesList);
      emit(SimilarMoviesSuccess());
    } catch (e) {
      emit(SimilarMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
