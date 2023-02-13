part of 'similar_cubit.dart';

@immutable
abstract class SimilarState {}

class SimilarInitial extends SimilarState {}
//get similar movies states
class SimilarMoviesLoading extends SimilarState {}

class SimilarMoviesSuccess extends SimilarState {}

class SimilarMoviesFailure extends SimilarState {
  String errMessage;
  SimilarMoviesFailure({required this.errMessage});
}