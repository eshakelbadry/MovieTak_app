import 'package:flutter/material.dart';
import 'package:movie_info/commonComponents/horizontal_movies_items_list.dart';
import 'package:movie_info/commonComponents/movies_type_see_more_button.dart';
import 'package:movie_info/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/cubits/popular_cubit/popular_cubit.dart';
import 'package:movie_info/cubits/up_coming_cubit/up_coming_cubit.dart';

import '../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../cubits/top_rated_cubit/top_rated_cubit.dart';
import '../models/movie_model.dart';
import '../screens/seeMoreScreen/see_more_screen.dart';

////////////////////////////////////

// now playing movis list on screen

class NowPlayingMoviesData extends StatelessWidget {
  const NowPlayingMoviesData({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final movieCubit =
        BlocProvider.of<NowPlayingCubit>(context).getNowPlayingMovies();
    return Column(
      children: [
        MoviesTypeAndSeeMoreButtonWidget(
          width: width,
          moviesType: 'NowPlaying',
          seeMorePageType: const SeeMoreNowPlayingPage(),
        ),
        BlocConsumer<NowPlayingCubit, NowPlayingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NowPlayingMoviesSuccess) {
              return HorizontalNowPlayingMoviesItemsList(
                  height: height, width: width);
            } else if (state is NowPlayingMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NowPlayingMoviesFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(Icons.error),
                  Text('Error: ${state.errMessage}'),
                ],
              );
            }
            return Center(
              child: Container(
                child: const Text(
                  'Some thing went wrong',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

//////////////////////////////////////////
// popular movies list on screen
class PopularMoviesData extends StatelessWidget {
  const PopularMoviesData({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final movieCubit =
        BlocProvider.of<PopularCubit>(context).getPopularMovies();
    return Column(
      children: [
        MoviesTypeAndSeeMoreButtonWidget(
            width: width,
            moviesType: 'Popular',
            seeMorePageType: const SeeMorePopularPage()),
        BlocConsumer<PopularCubit, PopularState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is PopularMoviesSuccess) {
              return HorizontalPopularMoviesItemsList(
                  height: height, width: width);
            } else if (state is PopularMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PopularMoviesFailure) {
              // return const Center(
              //     child: Icon(
              //   Icons.error_outline_rounded,
              //   size: 20,
              // ));
              Center(
                child: Text('Error: ${state.errMessage}'),
              );
            }
            return Center(
              child: Container(
                child: const Text(
                  'Some thing went wrong',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

//////////////////////////////////////
// top rated movies list on screen

class TopRatedMoviesData extends StatelessWidget {
  const TopRatedMoviesData({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final movieTopRatedCubit =
        BlocProvider.of<TopRatedCubit>(context).getTopRatedMovies();
    return Column(
      children: [
        MoviesTypeAndSeeMoreButtonWidget(
            width: width,
            moviesType: 'TopRated',
            seeMorePageType: const SeeMoreTopRatedPage()),
        BlocConsumer<TopRatedCubit, TopRatedState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TopRatedMoviesSuccess) {
              return HorizontalTopRatedMoviesItemsList(
                  height: height, width: width);
            } else if (state is TopRatedMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopRatedMoviesFailure) {
              return Center(
                child: Text('Error: ${state.errMessage}'),
              );
            }
            return Center(
              child: Container(
                child: const Text(
                  'Some thing went wrong',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

///////////////////////////////////////
// upComing movies list on screen

class UpComingMoviesData extends StatelessWidget {
  const UpComingMoviesData({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final movieUpomingCubit =
        BlocProvider.of<UpComingCubit>(context).getUpComingMovies();
    return Column(
      children: [
        MoviesTypeAndSeeMoreButtonWidget(
            width: width,
            moviesType: 'UpComing',
            seeMorePageType: const SeeMoreUpComingPage()),
        BlocConsumer<UpComingCubit, UpComingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UpComingMoviesSuccess) {
              return HorizontalUpComingMoviesItemsList(
                  height: height, width: width);
            } else if (state is UpComingMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UpComingMoviesFailure) {
              return Center(
                child: Text('Error: ${state.errMessage}'),
              );
            }
            return const Center(
              child: Text(
                'Some thing went wrong',
                style: TextStyle(fontSize: 25),
              ),
            );
          },
        )
      ],
    );
  }
}
