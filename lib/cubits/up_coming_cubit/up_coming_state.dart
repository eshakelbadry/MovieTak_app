part of 'up_coming_cubit.dart';

@immutable
abstract class UpComingState {}

class UpComingInitial extends UpComingState {}
//get upComing movies states
class UpComingMoviesLoading extends UpComingState {}

class UpComingMoviesSuccess extends UpComingState {}

class UpComingMoviesFailure extends UpComingState {
  String errMessage;
  UpComingMoviesFailure({required this.errMessage});
}