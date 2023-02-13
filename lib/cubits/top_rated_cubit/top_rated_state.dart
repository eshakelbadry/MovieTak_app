part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}
class TopRatedMoviesLoading extends TopRatedState {}

class TopRatedMoviesSuccess extends TopRatedState {}

class TopRatedMoviesFailure extends TopRatedState {
  String errMessage;
  TopRatedMoviesFailure({required this.errMessage});
}