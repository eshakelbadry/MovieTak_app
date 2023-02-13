import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:movie_info/models/movie_model.dart';
import 'package:movie_info/screens/details_test.dart';

import 'package:movie_info/screens/home/components/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubits/details_movies_cubit/details_movies_cubit.dart';
import '../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../services/popular_movies_service.dart';

import 'home/components/category_list.dart';
import 'home/components/genres_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   // List<Movie> moviesList = [];
//   @override
//   Widget build(BuildContext context) {
//     final movieCubit = BlocProvider.of<MovieCubit>(context).fetchMovies();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.black,
//                 size: 25,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: BlocConsumer<MovieCubit, MovieState>(
//             listener: (context, state) {
//               // if (state is MovieSuccess) {
//               //   var movieList = state.moviesList;
//               // }
//             },
//             builder: (context, state) {
//               if (state is MovieSuccess) {
//             //     return InfiniteListView(
//             //   onReachEnd: () {
//             //     movieCubit.fetchMoreMovies();
//             //   },
//             //   children: state.moviesList.map((movie) {
//             //     return MovieCard(movie: movie);
//             //   }).toList(),
//             // );
//                 return ListView.builder(
//                   itemCount: state.moviesList.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(state.moviesList[index].title),
//                       subtitle: Text(state.moviesList[index].releaseDate),
//                       leading: Image.network(
//                           'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
//                               state.moviesList[index].poster),
//                     );
//                   },
//                 );
//               }
//               if (state is MovieLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is MovieFailure) {
//                 return Center(
//                   child: Text('Error: ${state.errMessage}'),
//                 );
//               }
//               return Container(child: Text('data'));
//             },

//           ))
//         ],
//       ),
//     );
//   }
// }

// Container(
//   height: 50,
//   width: double.infinity,

//   child: TextButton(
//       onPressed: () {
//         movieCubit.fetchMovies();
//         // print(state);
//       },
//       child: Text('Fetch Movies')),
// ),

//  GestureDetector(
//           onTap: () async {
//             MovieService Service = MovieService();
//             MovieModel movieData = await Service.getMovie();});

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   // List<Movie> moviesdetails = [];
//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<NowPlayingCubit>(context);
//     final movieCubit =
//         BlocProvider.of<NowPlayingCubit>(context).getNowPlayingMovies();

//     // final movi = BlocProvider.of<DetailsMoviesCubit>(context);
//     //      final movi =
//     // BlocProvider.of<DetailsMoviesCubit>(context).getDetailsMovies(id:315162 );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.black,
//                 size: 25,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: BlocConsumer<NowPlayingCubit, NowPlayingState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is NowPlayingMoviesSuccess) {
//             return NotificationListener<ScrollNotification>(
//                 onNotification: (scrollInfo) {
//                   if (scrollInfo is ScrollEndNotification &&
//                       scrollInfo.metrics.pixels ==
//                           scrollInfo.metrics.maxScrollExtent) {
//                     // BlocProvider.of<MovieCubit>(context).fetchNextPage();
//                   }
//                   return true;
//                 },
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate(
//                         (context, index) {

//                           return GestureDetector(
//                             onTap: () {
//             //  final cubitt = BlocProvider.of<DetailsMoviesCubit>(context);
//                               // final detailsCubit =
//                               //     BlocProvider.of<NowPlayingCubit>(context)
//                               //         .getDetailsMovies(
//                               //             id: cubit
//                               //                 .nowPlayingMoviesList[index].id);
//                               // print(cubit.detailsMovies!.id);
//                               // movi.detailsMovies = null;
//                               // detailsCubit.getDetailsMovies(
//                               //     id: cubit.nowPlayingMoviesList[index].id);
//                               // movi.getDetailsMovies(
//                               //     id: cubit.nowPlayingMoviesList[index].id);
//                               print(cubit.nowPlayingMoviesList[index].id);
//                               Navigator.push(context, MaterialPageRoute(
//                                 builder: (context) {
//                                   return DetailsBody(
//                                       id: cubit.nowPlayingMoviesList[index].id,
//                                       indexx: index);
//                                 },
//                               ));
//                             },
//                             child: ListTile(
//                               title:
//                                   Text(cubit.nowPlayingMoviesList[index].title),
//                               subtitle: Text(cubit
//                                   .nowPlayingMoviesList[index].releaseDate),
//                               leading: Image.network(
//                                   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
//                                       cubit.nowPlayingMoviesList[index].poster),
//                             ),
//                           );
//                         },
//                         childCount: cubit.nowPlayingMoviesList.length,
//                       ),
//                     ),
//                   ],
//                 )
//                 // child: ListView.builder(
//                 //   itemCount: state.moviesList.length,
//                 //   itemBuilder: (context, index) {
//                 //     return ListTile(
//                 //       title: Text(state.moviesList[index].title),
//                 //       subtitle: Text(state.moviesList[index].releaseDate),
//                 //       leading: Image.network(
//                 //           'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
//                 //               state.moviesList[index].poster),
//                 //     );
//                 //   },
//                 // ),
//                 );
//           } else if (state is NowPlayingMoviesLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is NowPlayingMoviesFailure) {
//             return Center(
//               child: Text('Error: ${state.errMessage}'),
//             );
//           }
//           return Container(
//             child: Text('data'),
//           );
//         },
//       ),
//     );
//   }
// }
class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Row(
            children: [
              SizedBox(width: 100),
              Text('title'),
              SizedBox(width: 50),
              IconButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.setStringList('favorite', <String>[]);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          SizedBox(height: 50),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FavoritePage();
                  },
                ));
              },
              child: Text('go to favorite'))
        ],
      ),
    )));
  }
}
