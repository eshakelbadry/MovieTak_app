import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_info/commonComponents/movies_type_see_more_button.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/cubits/app_cubit/app_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/models/movie_model.dart';

import '../../commonComponents/horizontal_movies_items_list.dart';
import '../../commonComponents/types_of_movies.dart';
import '../detailsScreen/details_screen.dart';
import '../seeMoreScreen/see_more_screen.dart';

class HomeBody extends StatelessWidget {
  HomeBody({
    super.key,
  });
  List<Movie> moviesdetails = [];

  @override
  Widget build(BuildContext context) {
    // final movieCubit = BlocProvider.of<MovieCubit>(context).getPopularMovies();
    // final moviCubit = BlocProvider.of<MovieCubit>(context).getTopRatedMovies();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 2),
                  const Text(
                    'Welcome To MovieX',
                    style: TextStyle(fontFamily: pacificoFont),
                  ),
                  // const SizedBox(width: 4),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).changeAppMode();
                      },
                      icon: const Icon(Icons.brightness_2))
                ]),
          ),
          NowPlayingMoviesData(width: width, height: height),
          SizedBox(height: height * 0.02),
          PopularMoviesData(width: width, height: height),
          SizedBox(height: height * 0.02),
          TopRatedMoviesData(width: width, height: height),
          SizedBox(height: height * 0.02),
          UpComingMoviesData(width: width, height: height),
        ],
      ),
    );
  }
}





      // child: Container(
      //   height: height * 0.33,
      //   // color: Colors.amber,
      //   child: CustomScrollView(
      //     scrollDirection: Axis.horizontal,
      //     slivers: [
      //       SliverList(
      //         delegate: SliverChildBuilderDelegate((context, index) {
      //           return GestureDetector(
      //             child: Padding(
      //               padding: const EdgeInsets.all(4.0),
      //               child: Container(
      //                 // height: height * 0.2,
      //                 width: width * 0.45,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(15),
      //                   // color: Colors.greenAccent,
      //                   // ),
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(15),
      //                   child: Image.network(
      //                     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${state.moviesList[index].poster}',
      //                     fit: BoxFit.fill,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             onTap: () {
      //               Navigator.push(context, MaterialPageRoute(
      //                 builder: (context) {
      //                   return DetailsPage();
      //                 },
      //               ));
      //             },
      //           );
      //         }, childCount: state.moviesList.length),
      //       ),
      //     ],
      //   ),
      // ),
 