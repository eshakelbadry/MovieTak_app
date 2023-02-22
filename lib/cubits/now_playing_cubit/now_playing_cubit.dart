import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/movie_model.dart';
import '../../services/nowPlaying_movies_service.dart';


part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this._nowPlayingMoviesService) : super(NowPlayingInitial());

  List<Movie> nowPlayingMoviesList = [];

  final NowPlayingMoviesService _nowPlayingMoviesService;

  Future<void> getNowPlayingMovies() async {
    try {
      emit(NowPlayingMoviesLoading());
      nowPlayingMoviesList =
          await _nowPlayingMoviesService.fetchNowPlayingMovies();

      emit(NowPlayingMoviesSuccess());
    } catch (e) {
      emit(NowPlayingMoviesFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
