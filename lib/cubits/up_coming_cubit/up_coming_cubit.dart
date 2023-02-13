import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/models/movie_model.dart';

import '../../services/upComing_movies_service.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit(this._upComingMoviesService) : super(UpComingInitial());
  List<Movie> upComingMoviesList = [];
  final UpComingMoviesService _upComingMoviesService;
  Future<void> getUpComingMovies() async {
    try {
      emit(UpComingMoviesLoading());
      upComingMoviesList = await _upComingMoviesService.fetchUpComingMovies();
      // print(movies..title);
      emit(UpComingMoviesSuccess());
    } catch (e) {
      emit(UpComingMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
