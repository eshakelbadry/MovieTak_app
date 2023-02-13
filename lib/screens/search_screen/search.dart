import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/cubits/search_cubit/search_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper.dart';
import '../detailsScreen/details_screen.dart';

class SearchPage extends StatelessWidget {
// final movieSearch=BlocProvider.of<MovieCubit>(context).searchMovies(movieName: '');
  SearchPage({super.key});
  String movieNamee = '';
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: _searchController,
              onChanged: (data) {
                movieNamee = data;
                //   BlocProvider.of<SearchCubit>(context)
                //       .getSearchedMovies(movieName: movieNamee);
                // },
                if (data.isNotEmpty) {
                  // BlocProvider.of<SearchCubit>(context)
                  //     .getSearchedMovies(movieName: movieNamee);
                  // BlocProvider.of<SearchCubit>(context)
                  //     .searchedMoviesList
                  //     .clear();
                  // BlocProvider.of<SearchCubit>(context).clearSearchResults();
                }
              },
              onSubmitted: (data) {
                movieNamee = data;
                // if (data.isEmpty) {
                //   BlocProvider.of<SearchCubit>(context)
                //       .searchedMoviesList
                //       .clear();
                // } else
                BlocProvider.of<SearchCubit>(context).clearSearchResults();
                BlocProvider.of<SearchCubit>(context)
                    .getSearchedMovies(movieName: movieNamee);
                // {
                //   BlocProvider.of<SearchCubit>(context)
                //       .getSearchedMovies(movieName: movieNamee);
                // }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 68, 88, 98),
                hoverColor: const Color.fromARGB(255, 68, 88, 98),
                focusColor: const Color.fromARGB(255, 68, 88, 98),
                suffixIconColor: Colors.white,
                suffixIcon: GestureDetector(
                    onTap: () async {
                      BlocProvider.of<SearchCubit>(context)
                          .clearSearchResults();
                      // BlocProvider.of<SearchCubit>(context);
                      BlocProvider.of<SearchCubit>(context)
                          .getSearchedMovies(movieName: _searchController.text);
                    },
                    child: const Icon(Icons.search, size: 30)),
                contentPadding: const EdgeInsets.only(
                    top: 28, bottom: 28, left: 22, right: 22),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Enter a Movie Name',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Colors.white,
                  // backgroundColor: Color.fromARGB(255, 54, 132, 158)
                ),
              ),
            ),
          ),
        ),
        BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // movieName = data;
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<SearchCubit>(context);
            // final movieCubit = BlocProvider.of<SearchCubit>(context)
            //     .getSearchedMovies(movieName: movieNamee);
            if (state is SearchMoviesSuccess) {
              return state.searchedMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (() {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsPage(
                                                    id: state
                                                        .searchedMoviesList[
                                                            index]
                                                        .id,
                                                  );
                                                },
                                              ));
                                            }),
                                            child: Container(
                                              height: height * 0.23,
                                              width: width * 0.38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: state
                                                                .searchedMoviesList[
                                                                    index]
                                                                .poster ==
                                                            null ||
                                                        state
                                                            .searchedMoviesList[
                                                                index]
                                                            .poster
                                                            .isEmpty
                                                    ? const ErrorImageWidget()
                                                    : CachedNetworkImage(
                                                        imageUrl:
                                                            '$basePicturesUrl${state.searchedMoviesList[index].poster}',
                                                        fit: BoxFit.fill,
                                                        errorWidget: (context,
                                                            url, error) {
                                                          return const ErrorImageWidget();
                                                        },
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  state.searchedMoviesList
                                                              .isNotEmpty &&
                                                          state
                                                              .searchedMoviesList[
                                                                  index]
                                                              .title
                                                              .isNotEmpty
                                                      ? Text(
                                                          state
                                                              .searchedMoviesList[
                                                                  index]
                                                              .title,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      : const Text('N/A'),
                                                  SizedBox(
                                                      height: height * 0.02),
                                                  Text(
                                                    state
                                                            .searchedMoviesList[
                                                                index]
                                                            .releaseDate
                                                            .isNotEmpty
                                                        ? formatReleaseDate(state
                                                            .searchedMoviesList[
                                                                index]
                                                            .releaseDate)
                                                        : "N/A",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.02),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.star_outlined,
                                                          size: 25,
                                                          color: Colors.amber),
                                                      SizedBox(
                                                          width: width * 0.01),
                                                      Text(
                                                          state
                                                                      .searchedMoviesList
                                                                      .isNotEmpty &&
                                                                  state
                                                                          .searchedMoviesList[
                                                                              index]
                                                                          .votingAverage !=
                                                                      null
                                                              ? (state
                                                                          .searchedMoviesList[
                                                                              index]
                                                                          .votingAverage
                                                                      is int
                                                                  ? state
                                                                      .searchedMoviesList[
                                                                          index]
                                                                      .votingAverage
                                                                      .toString()
                                                                  : state
                                                                      .searchedMoviesList[
                                                                          index]
                                                                      .votingAverage
                                                                      .toString()
                                                                      .padLeft(
                                                                          3,
                                                                          "0")
                                                                      .substring(
                                                                          0, 3))
                                                              : "N/A",
                                                          style:
                                                              const TextStyle(
                                                                  // color: Colors.white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: height * 0.02),
                                      const Divider(
                                          color: Colors.grey,
                                          thickness: 1.2,
                                          indent: 20,
                                          endIndent: 20),
                                      SizedBox(height: height * 0.01),
                                    ],
                                  ),
                                );
                              },
                              childCount: state.searchedMoviesList.length,
                            ),
                          ),
                        ],
                      ),
                    );
            } else if (state is SearchMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchMoviesFailure) {
              return Center(
                child: Text('Error: ${state.errMessage}'),
              );
            }
            // else if (state is SearchInitial) {
            //   cubit.searchedMoviesList.clear();
            // }
            return Container();
          },
        ),
      ],
    );
  }
}
