part of 'details_movies_cubit.dart';

@immutable
abstract class DetailsMoviesState {}

class DetailsMoviesInitial extends DetailsMoviesState {}
class DetailsMoviesLoading extends DetailsMoviesState {}

class DetailsMoviesSuccess extends DetailsMoviesState {}

class DetailsMoviesFailure extends DetailsMoviesState {
  String errMessage;
  DetailsMoviesFailure({required this.errMessage});
}