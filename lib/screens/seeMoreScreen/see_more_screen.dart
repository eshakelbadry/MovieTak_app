import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/constants.dart';

import 'package:movie_info/cubits/now_playing_cubit/now_playing_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/cubits/popular_cubit/popular_cubit.dart';

import '../../cubits/top_rated_cubit/top_rated_cubit.dart';
import '../../cubits/up_coming_cubit/up_coming_cubit.dart';
import '../../helper.dart';
import '../detailsScreen/details_screen.dart';

/////////////////////////////////////////////////
//see more now playing page
class SeeMoreNowPlayingPage extends StatelessWidget {
  const SeeMoreNowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<NowPlayingCubit, NowPlayingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<NowPlayingCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('NowPlaying Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.nowPlayingMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.nowPlayingMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String nowPlayingPosterUrl =
                            cubit.nowPlayingMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: cubit.nowPlayingMoviesList != null &&
                                        nowPlayingPosterUrl.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$basePicturesUrl$nowPlayingPosterUrl',
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) {
                                          return const ErrorImageWidget();
                                        },
                                      )
                                    : const ErrorImageWidget()),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.nowPlayingMoviesList[index].id);
                              },
                            ));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}

/////////////////////////////////////////
//  popular see more page

class SeeMorePopularPage extends StatelessWidget {
  const SeeMorePopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<PopularCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('Popular Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.popularMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.popularMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String popularPosterUrl =
                            cubit.popularMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            // height: height * 0.33,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: cubit.popularMoviesList != null &&
                                      popularPosterUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          '$basePicturesUrl$popularPosterUrl',
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) {
                                        return const ErrorImageWidget();
                                      },
                                    )
                                  : const ErrorImageWidget(),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.popularMoviesList[index].id);
                              },
                            ));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}

////////////////////////////////////////
//  top rated see more page

class SeeMoreTopRatedPage extends StatelessWidget {
  const SeeMoreTopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<TopRatedCubit, TopRatedState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<TopRatedCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('TopRated Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.topRatedMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.topRatedMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String topRatedPosterUrl =
                            cubit.topRatedMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: cubit.topRatedMoviesList != null &&
                                      topRatedPosterUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          '$basePicturesUrl$topRatedPosterUrl',
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) {
                                        return const ErrorImageWidget();
                                      },
                                    )
                                  : const ErrorImageWidget(),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.topRatedMoviesList[index].id);
                              },
                            ));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}

////////////////////////////////////////////
// up coming see more page

class SeeMoreUpComingPage extends StatelessWidget {
  const SeeMoreUpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<UpComingCubit, UpComingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<UpComingCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('UpComing Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.upComingMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.upComingMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String upComingPosterUrl =
                            cubit.upComingMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: cubit.upComingMoviesList != null &&
                                      upComingPosterUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          '$basePicturesUrl$upComingPosterUrl',
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) {
                                        return const ErrorImageWidget();
                                      },
                                    )
                                  : const ErrorImageWidget(),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.upComingMoviesList[index].id);
                              },
                            ));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
