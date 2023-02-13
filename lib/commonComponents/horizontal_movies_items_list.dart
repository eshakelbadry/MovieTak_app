import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/cubits/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_info/cubits/popular_cubit/popular_cubit.dart';
import 'package:movie_info/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movie_info/models/movie_model.dart';

import '../cubits/details_movies_cubit/details_movies_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/up_coming_cubit/up_coming_cubit.dart';
import '../helper.dart';
import '../screens/detailsScreen/details_screen.dart';

////////////////////////////////////////
//now playing horizontal movies list

class HorizontalNowPlayingMoviesItemsList extends StatelessWidget {
  HorizontalNowPlayingMoviesItemsList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  List<Movie> moviesdetails = [];
  @override
  Widget build(BuildContext context) {
    final nowPlayingCubit = BlocProvider.of<NowPlayingCubit>(context);

    return BlocConsumer<NowPlayingCubit, NowPlayingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: height * 0.45,
          child: nowPlayingCubit.nowPlayingMoviesList == null
              ? const Center(
                  child: Icon(Icons.error_outline_outlined, size: 30),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      nowPlayingCubit.nowPlayingMoviesList.take(20).length,
                  itemBuilder: (context, index) {
                    String nowPlayingPosterUrl =
                        nowPlayingCubit.nowPlayingMoviesList[index].poster;

                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          // height: height * 0.2,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                                nowPlayingCubit.nowPlayingMoviesList[index] !=
                                            null &&
                                        nowPlayingCubit
                                            .nowPlayingMoviesList[index]
                                            .poster
                                            .isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$basePicturesUrl$nowPlayingPosterUrl',
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) {
                                          return const ErrorImageWidget();
                                        },
                                      )
                                    : const ErrorImageWidget(),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(
                                id: nowPlayingCubit
                                    .nowPlayingMoviesList[index].id);
                          },
                        ));
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}

////////////////////////////////////////
//popular horizontal movies list

class HorizontalPopularMoviesItemsList extends StatelessWidget {
  HorizontalPopularMoviesItemsList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  List<Movie> moviesdetails = [];
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PopularCubit>(context);
    return BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: height * 0.33,
            child: cubit.popularMoviesList == null
                ? const Center(
                    child: Icon(Icons.error_outline_outlined, size: 30),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.popularMoviesList.take(20).length,
                    itemBuilder: (context, index) {
                      String popularPosterUrl =
                          cubit.popularMoviesList[index].poster;

                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            // height: height * 0.2,
                            width: width * 0.47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: cubit.popularMoviesList[index] != null ||
                                      cubit.popularMoviesList[index].poster
                                          .isNotEmpty
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
          );
        });
  }
}

/////////////////////////////////////
//top rated horzontal movies list

class HorizontalTopRatedMoviesItemsList extends StatelessWidget {
  HorizontalTopRatedMoviesItemsList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  List<Movie> moviesdetails = [];
  @override
  Widget build(BuildContext context) {
    final topRatedCubit = BlocProvider.of<TopRatedCubit>(context);
    return BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: height * 0.33,
            child: topRatedCubit.topRatedMoviesList == null
                ? const Center(
                    child: Icon(Icons.error_outline_outlined, size: 30),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedCubit.topRatedMoviesList.take(20).length,
                    itemBuilder: (context, index) {
                      String topRatedPosterUrl =
                          topRatedCubit.topRatedMoviesList[index].poster;

                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            // height: height * 0.2,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: topRatedCubit.topRatedMoviesList[index] !=
                                          null ||
                                      topRatedCubit.topRatedMoviesList[index]
                                          .poster.isNotEmpty
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
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(
                                  id: topRatedCubit
                                      .topRatedMoviesList[index].id);
                            },
                          ));
                        },
                      );
                    },
                  ),
          );
        });
  }
}

////////////////////////////////////////
//now playing horizontal movies list

class HorizontalUpComingMoviesItemsList extends StatelessWidget {
  HorizontalUpComingMoviesItemsList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final upComingCubit = BlocProvider.of<UpComingCubit>(context);

    return BlocConsumer<UpComingCubit, UpComingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: height * 0.33,
            child: upComingCubit.upComingMoviesList == null
                ? const Center(
                    child: Icon(Icons.error_outline_outlined, size: 30),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: upComingCubit.upComingMoviesList.take(20).length,
                    itemBuilder: (context, index) {
                      String upComingPosterUrl =
                          upComingCubit.upComingMoviesList[index].poster;

                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            // height: height * 0.2,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                    upComingCubit.upComingMoviesList[index] !=
                                                null ||
                                            upComingCubit
                                                .upComingMoviesList[index]
                                                .poster
                                                .isNotEmpty
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
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(
                                  id: upComingCubit
                                      .upComingMoviesList[index].id);
                            },
                          ));
                        },
                      );
                    },
                  ),
          );
        });
  }
}

////////////////////////
///  //  CustomScrollView(scrollDirection: Axis.horizontal, slivers: [
//   SliverList(
//     delegate: SliverChildBuilderDelegate(
//       (context, index) {
//         String upComingPosterUrl =
//             cubit.upComingMoviesList[index].poster;
//         //https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wtFwgFFk1ze789ghcadWGEVjj3N.jpg
//         String basePosterUrl =
//             'https://www.themoviedb.org/t/p/w300_and_h450_bestv2';
//         return GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Container(
//               // height: height * 0.2,
//               width: width * 0.45,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 // color: Colors.greenAccent,
//                 // ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: cubit.upComingMoviesList[index].poster ==
//                             null ||
//                         cubit.upComingMoviesList[index].poster
//                             .isEmpty
//                     ? Image.asset(
//                         'assets/images/moviepic.png',
//                         fit: BoxFit.fill,
//                       )
//                     : Image.network(
//                         '$basePosterUrl$upComingPosterUrl',
//                         fit: BoxFit.fill,
//                       ),
//               ),
//             ),
//           ),
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) {
//                 return DetailsPage(
//                     id: cubit.upComingMoviesList[index].id);
//               },
//             ));
//           },
//         );
//       },
//       childCount: cubit.upComingMoviesList.length,
//     ),
//   )
// ]),
