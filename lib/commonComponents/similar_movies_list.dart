import 'package:flutter/material.dart';
import 'package:movie_info/commonComponents/horizontal_movies_items_list.dart';
import 'package:movie_info/commonComponents/movies_type_see_more_button.dart';
import 'package:movie_info/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/cubits/up_coming_cubit/up_coming_cubit.dart';

import '../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../cubits/top_rated_cubit/top_rated_cubit.dart';
import '../models/movie_model.dart';
import '../screens/seeMoreScreen/see_more_screen.dart';



//////////////////////////////////////////
//similar movies list on screen

// class SimilarMoviesData extends StatelessWidget {
//   const SimilarMoviesData({
//     super.key,
//     required this.width,
//     required this.height,
//   });

//   final double width;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     final movieCubit =
//         BlocProvider.of<UpComingCubit>(context).getUpComingMovies();
//     return Column(
//       children: [
//         const Text(
//           'Similar Movies',
//           style: TextStyle(fontFamily: poppinsFont, fontSize: 21),
//         ),
//         BlocConsumer<UpComingCubit, UpComingState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             // final movieCubit = BlocProvider.of<MovieCubit>(context);
//             if (state is UpComingMoviesSuccess) {
//               return HorizontalUpComingMoviesItemsList(
//                   height: height, width: width);
//             } else if (state is UpComingMoviesLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is UpComingMoviesFailure) {
//               return Center(
//                 child: Text('Error: ${state.errMessage}'),
//               );
//             }
//             return Center(
//               child: Container(
//                 child: const Text(
//                   'Some thing went wrong',
//                   style: TextStyle(fontSize: 25),
//                 ),
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }
