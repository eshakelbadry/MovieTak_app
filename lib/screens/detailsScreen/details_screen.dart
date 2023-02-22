import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../cubits/details_movies_cubit/details_movies_cubit.dart';
import '../../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../../cubits/similar_cubit/similar_cubit.dart';
import '../../cubits/similar_cubit/similar_cubit.dart';
import '../../cubits/watch_list_cubit/watch_list_cubit.dart';
import '../../helper.dart';
import '../../models/movie_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.id});

  int id;
  @override
  Widget build(BuildContext context) {
    final detailsCubit =
        BlocProvider.of<DetailsMoviesCubit>(context).getDetailsMovies(id: id);
    final similarCubit =
        BlocProvider.of<SimilarCubit>(context).getSimilarMovies(id: id);
    // final genresCubit =
    //     BlocProvider.of<DetailsMoviesCubit>(context).getGenresMovies(id: id);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            BlocConsumer<DetailsMoviesCubit, DetailsMoviesState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<DetailsMoviesCubit>(context);
                if (state is DetailsMoviesSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.51,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: height * 0.47,
                              width: width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                ),
                                child: cubit.detailsMovies != null ||
                                        cubit.detailsMovies!.backdropPath!
                                            .isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$basePicturesUrl${cubit.detailsMovies!.backdropPath}',
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) {
                                          return const ErrorBackdropImageWidget();
                                        },
                                      )
                                    : const Center(
                                        child: Icon(
                                            Icons.error_outline_outlined,
                                            size: 30),
                                      ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: height * 0.08,
                                width: width * 0.75,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                  ),
                                  color: Color.fromARGB(255, 215, 212, 212),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: width * 0.07),
                                    Text(
                                        cubit.detailsMovies != null &&
                                                cubit.detailsMovies!
                                                        .releaseDate !=
                                                    null
                                            ? formatReleaseDate(cubit
                                                .detailsMovies!.releaseDate!)
                                            : "N/A    ",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: width * 0.03),
                                    const Icon(Icons.star_outlined,
                                        size: 25, color: Colors.amber),
                                    SizedBox(width: width * 0.006),
                                    Text(
                                        cubit.detailsMovies != null &&
                                                cubit.detailsMovies!
                                                        .voteAverage !=
                                                    null
                                            ? (cubit.detailsMovies!.voteAverage
                                                    is int
                                                ? cubit
                                                    .detailsMovies!.voteAverage
                                                    .toString()
                                                : cubit
                                                    .detailsMovies!.voteAverage
                                                    .toString()
                                                    .padLeft(3, "0")
                                                    .substring(0, 3))
                                            : "N/A",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: width * 0.03),
                                    const Icon(Icons.access_time_outlined,
                                        color: Colors.black, size: 26),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                        cubit.detailsMovies != null &&
                                                cubit.detailsMovies!.runtime !=
                                                    null
                                            ? "${(cubit.detailsMovies!.runtime! / 60).floor()}h"
                                            : "N/A",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                    const SizedBox(width: 5),
                                    Text(
                                        cubit.detailsMovies != null &&
                                                cubit.detailsMovies!.runtime !=
                                                    null
                                            ? "${(cubit.detailsMovies!.runtime!).remainder(60)}m"
                                            : "N/A",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.11,
                              width: width * 0.2,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                  color: Color.fromARGB(255, 35, 80, 101)),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_sharp,
                                    color: Colors.white, size: 25),
                              ),
                            ),
                            // Positioned(
                            //   top: 10,
                            //   right: 15,
                            //   child: Container(
                            //     height: height * 0.08,
                            //     width: width * 0.16,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(15),
                            //       color: const Color.fromARGB(255, 35, 80, 101),
                            //     ),
                            //     child: IconButton(
                            //         onPressed: () {
                            //           // BlocProvider.of<WatchListCubit>(context)
                            //           //     .addToWatchList();
                            //         },
                            //         icon: const FaIcon(
                            //           FontAwesomeIcons.heart,
                            //           color: Colors.white,
                            //           size: 35,
                            //         )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: cubit.detailsMovies != null &&
                                cubit.detailsMovies!.title != null
                            ? Text(
                                '${cubit.detailsMovies!.title}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text('N/A'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Overview',
                          style: TextStyle(
                              color: Color.fromARGB(95, 96, 94, 94),
                              fontSize: 18,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 15, right: 25),
                        child: cubit.detailsMovies != null &&
                                cubit.detailsMovies!.overview != null
                            ? Text('${cubit.detailsMovies!.overview}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                ))
                            : const Text('There Is No Text Found'),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 15, top: 10),
                      //   child: Text(
                      //     'Genres',
                      //     style: TextStyle(
                      //         color: Color.fromARGB(95, 173, 166, 166),
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                      // Row(
                      //   children: [Text('${cubit.genresList}')],
                      // )
                      SizedBox(height: height * 0.025),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Similar Movies',
                          style: TextStyle(
                              // color: Colors.white,
                              fontFamily: poppinsFont,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  );
                } else if (state is DetailsMoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DetailsMoviesFailure) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: height * 0.4),
                      const Icon(Icons.error, size: 60),
                      Text('Error: ${state.errMessage}'),
                    ],
                  );
                }
                return const Text('error ');
              },
            ),
            BlocConsumer<SimilarCubit, SimilarState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<SimilarCubit>(context);

                if (state is SimilarMoviesSuccess) {
                  return cubit.similarMoviesList.isEmpty
                      ? const NoSimilarMoviesErrorWidget()
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                              height: height * 0.6,
                              child: GridView.builder(
                                itemCount: cubit.similarMoviesList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                ),
                                itemBuilder: (context, index) {
                                  String similarPosterUrl =
                                      cubit.similarMoviesList[index].poster;

                                  return GestureDetector(
                                    child: Container(
                                      // height: height * 0.33,
                                      width: width * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: cubit.similarMoviesList[index]
                                                        .poster ==
                                                    null ||
                                                cubit.similarMoviesList[index]
                                                    .poster.isEmpty
                                            ? const ErrorPosterImageWidget()
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    '$basePicturesUrl$similarPosterUrl',
                                                fit: BoxFit.fill,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const ErrorPosterImageWidget();
                                                },
                                              ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return DetailsPage(
                                              id: cubit
                                                  .similarMoviesList[index].id);
                                        },
                                      ));
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                }
                // else if (state is SimilarMoviesLoading) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                else if (state is SimilarMoviesFailure) {
                  return Center(
                    child: Text('Error: ${state.errMessage}'),
                  );
                }
                return Container();
              },
            )
          ]),
        ),
      ),
    );
  }
}
