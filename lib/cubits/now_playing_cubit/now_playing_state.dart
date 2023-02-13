part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

//get now playing movies states
class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesSuccess extends NowPlayingState {}

class NowPlayingMoviesFailure extends NowPlayingState {
  String errMessage;
  NowPlayingMoviesFailure({required this.errMessage});
}

// class DetailsMoviesLoading extends NowPlayingState {}

// class DetailsMoviesSuccess extends NowPlayingState {}

// class DetailsMoviesFailure extends NowPlayingState {
//   String errMessage;
//   DetailsMoviesFailure({required this.errMessage});
// }
