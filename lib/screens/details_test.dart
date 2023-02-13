import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_info/cubits/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_info/models/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubits/details_movies_cubit/details_movies_cubit.dart';

// class DetailsBody extends StatelessWidget {
//   DetailsBody({
//     super.key,
//     required this.id,
//     required this.indexx,
//   });
//   int indexx;
//   int id;

//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<DetailsMoviesCubit>(context);
//     final detailsCubit =
//         BlocProvider.of<DetailsMoviesCubit>(context).getDetailsMovies(id: id);

//     Size size = MediaQuery.of(context).size;
//     return BlocConsumer<DetailsMoviesCubit, DetailsMoviesState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         if (state is DetailsMoviesSuccess) {
//           return Scaffold(
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   height: size.height * 0.38,
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: size.height * 0.4 - 50,
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(
//                               50,
//                             ),
//                           ),
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${cubit.detailsMovies!.backdropPath}',
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SafeArea(child: BackButton()),
//                     ],
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 20),
//                   child: Text(
//                     'Plot Summary',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
//                 //   child: Text(cubit.detailsMovies.overview
//                 // movie.overview,
//                 // style: TextStyle(
//                 //   color: Colors.black.withOpacity(0.7),
//                 //   fontSize: 15,
//                 // ),
//                 //       ),
//                 // ),
//                 // CastCrew(
//                 //   casts: movie.cast,
//                 // ),
//               ],
//             ),
//           );
//         } else if (state is DetailsMoviesLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is DetailsMoviesFailure) {
//           return Center(
//             child: Text('Error: ${state.errMessage}'),
//           );
//         }
//         return Container(
//           child: Text('details '),
//         );
//       },
//     );
//   }
// }
class FavoritePage extends StatelessWidget {
   FavoritePage({super.key});

// Future<SharedPreferences> prefs =
//                          SharedPreferences.getInstance();
//                          final List<String>? items = prefs.getStringList('favorite');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: Row(
              children: [
                SizedBox(width: 40),
                Text('title'),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete))
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    ));
  }
}
