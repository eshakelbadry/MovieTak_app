// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:expandable_page_view/expandable_page_view.dart';
// import 'package:movie_info/models/movie.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../cubits/movie_cubit/movie_cubit.dart';
// import '../../details/details_page.dart';

// class MovieCard extends StatelessWidget {
//   const MovieCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MovieCubit, MovieState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         BlocProvider.of<MovieCubit>(context).fetchMovies();
//         if (state is MovieSuccess) {
         
//                   return ListView.builder(
//                     itemCount: state.moviesList.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(state.moviesList[index].title),
//                         subtitle: Text(state.moviesList[index].releaseDate),
//                         leading: Image.network(
//                             'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
//                                 state.moviesList[index].poster),
//                       );
//                     },
//                   );
//                 }
                
//              if (state is MovieLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is MovieFailure) {
//           return Center(
//             child: Text('Error: ${state.errMessage}'),
//           );
//         }
//         return Container(
//           child: Text('failed'),
//         ); 
          
        
//       }
        
//       );
//       }
    
//   }






























// class MovieCard extends StatefulWidget {
//   const MovieCard({super.key});

//   @override
//   State<MovieCard> createState() => _MovieCardState();
// }

// class _MovieCardState extends State<MovieCard> {
//   late PageController _pageController;

//   int initialPage = 1;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: AspectRatio(
//         aspectRatio: 0.73,
//         child: PageView.builder(
//           itemCount: movies.length,
//           itemBuilder: (context, index) => Padding(
//       padding: const EdgeInsets.all(20),
//       child: InkWell(
//         onDoubleTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailsPage(movie: movie),
//             ),
//           );
//         },
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [BoxShadow(color: Colors.grey)],
//                   borderRadius: BorderRadius.circular(50),
//                   image: DecorationImage(
//                     image: AssetImage(movie.poster),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 16),
//               child: Container(
//                 child: Text(
//                   movie.title,
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.star_outlined,
//                   size: 23,
//                   color: Colors.amber,
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   '${movie.rating}',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//           // Card(
//           //   movie: movies[index],
//           // ),
//         ),
//       ),
//     );
//   }
// }
