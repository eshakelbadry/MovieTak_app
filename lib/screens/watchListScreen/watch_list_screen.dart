import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_info/cubits/watch_list_cubit/watch_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// class WatchListPage extends StatelessWidget {
//   const WatchListPage({super.key});

//   // void _loadFavoriteMovies() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   final json = prefs.getString('favorite_movies');
//   //   if (json == null) {
//   //     return;
//   //   }
//   //   final favoriteMovies = List<Map<String, dynamic>>.from(jsonDecode(json));
//   //   context.bloc<WatchListCubit>().emit(favoriteMovies);
//   // }

//   // void _saveFavoriteMovies(List<Map<String, dynamic>> favoriteMovies) async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   prefs.setString('favorite_movies', jsonEncode(favoriteMovies));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         Container(
//           height: height * 0.08,
//           width: width,
//           color: const Color.fromARGB(255, 43, 65, 75),
//           child: const Center(
//             child: Text(
//               'Watch List',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//           ),
//         ),
//         Expanded(
//           child: CustomScrollView(
//             slivers: [
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     return Row(
//                       children: [
//                         Expanded(
//                           child: ListTile(
//                             title: Text('title'),
//                             subtitle: Text('releaseDate'),
//                             leading:
//                                 Image.asset('assets/images/backdrop_1.jpg'),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 15),
//                           child: Container(
//                             // height: height * 0.1,
//                             // width: width * 0.2,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: const Color.fromARGB(255, 35, 80, 101),
//                             ),
//                             child: IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.delete_forever,
//                                   color: Colors.white,
//                                   // size: 35,
//                                 )),
//                           ),
//                         ),
//                       ],
//                     );
//                     // return Padding(
//                     //   padding: const EdgeInsets.only(
//                     //       left: 12, right: 12, top: 10),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           GestureDetector(
//                     //             onTap: (() {
//                     //               Navigator.push(context,
//                     //                   MaterialPageRoute(
//                     //                 builder: (context) {
//                     //                   return DetailsPage(
//                     //                     id: state
//                     //                         .searchedMoviesList[index].id,
//                     //                   );
//                     //                 },
//                     //               ));
//                     //             }),
//                     //             child: Container(
//                     //               height: height * 0.23,
//                     //               width: width * 0.38,
//                     //               decoration: BoxDecoration(
//                     //                 borderRadius:
//                     //                     BorderRadius.circular(15),
//                     //               ),
//                     //               child: ClipRRect(
//                     //                 borderRadius:
//                     //                     BorderRadius.circular(15),
//                     //                 child: state.searchedMoviesList[index]
//                     //                                 .poster ==
//                     //                             null ||
//                     //                         state
//                     //                             .searchedMoviesList[index]
//                     //                             .poster
//                     //                             .isEmpty
//                     //                     ? Image.asset(
//                     //                         'assets/images/moviepic.png',
//                     //                         fit: BoxFit.fill,
//                     //                       )
//                     //                     : Image.network(
//                     //                         'https://image.tmdb.org/t/p/w300_and_h450_bestv2${state.searchedMoviesList[index].poster}',
//                     //                         fit: BoxFit.fill,
//                     //                       ),
//                     //               ),
//                     //             ),
//                     //           ),
//                     //           Expanded(
//                     //             child: Padding(
//                     //               padding: const EdgeInsets.only(
//                     //                   left: 15, right: 8),
//                     //               child: Column(
//                     //                 mainAxisAlignment:
//                     //                     MainAxisAlignment.start,
//                     //                 crossAxisAlignment:
//                     //                     CrossAxisAlignment.start,
//                     //                 children: [
//                     //                   Text(
//                     //                     state.searchedMoviesList[index]
//                     //                         .title,
//                     //                     style: const TextStyle(
//                     //                         color: Colors.white,
//                     //                         fontSize: 16,
//                     //                         fontWeight: FontWeight.w500),
//                     //                   ),
//                     //                   SizedBox(height: height * 0.02),
//                     //                   Text(
//                     //                     (state.searchedMoviesList[index]
//                     //                         .releaseDate),
//                     //                     style: const TextStyle(
//                     //                         color: Colors.white,
//                     //                         fontSize: 16,
//                     //                         fontWeight: FontWeight.w500),
//                     //                   ),
//                     //                   SizedBox(height: height * 0.02),
//                     //                   Row(
//                     //                     children: [
//                     //                       const Icon(Icons.star_outlined,
//                     //                           size: 25,
//                     //                           color: Colors.amber),
//                     //                       SizedBox(width: width * 0.01),
//                     //                       Text(
//                     //                           state
//                     //                               .searchedMoviesList[
//                     //                                   index]
//                     //                               .votingAverage
//                     //                               .toString(),
//                     //                           style: const TextStyle(
//                     //                               color: Colors.white,
//                     //                               fontWeight:
//                     //                                   FontWeight.w500)),
//                     //                     ],
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //           )
//                     //         ],
//                     //       ),
//                     //       SizedBox(height: height * 0.02),
//                     //       const Divider(
//                     //           color: Colors.grey,
//                     //           thickness: 1.2,
//                     //           indent: 20,
//                     //           endIndent: 20),
//                     //       SizedBox(height: height * 0.01),
//                     //     ],
//                     //   ),
//                     // );
//                   },
//                   childCount: 10,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }





class WatchListPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          if (state is WatchListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WatchListFetchSuccess) {
            final movies = state.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  leading: Image.network(
                    movie.poster,
                    height: 60,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.releaseDate),
                );
              },
            );
          }
          return Center(
            child: Text('No favorites'),
          );
        },
      ),
    );
  }
}