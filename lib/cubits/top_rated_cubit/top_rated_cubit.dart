import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/movie_model.dart';
import '../../services/topRated_movies_service.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this._topRatedMoviesService

  ) : super(TopRatedInitial());

List<Movie> topRatedMoviesList = [];


final TopRatedMoviesService _topRatedMoviesService;


 Future<void> getTopRatedMovies() async {
    try {
      emit(TopRatedMoviesLoading());
      topRatedMoviesList = await _topRatedMoviesService.fetchTopRatedMovies();
      // print(topRatedMoviesList);
      emit(TopRatedMoviesSuccess());
    } catch (e) {
      emit(TopRatedMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }


}
