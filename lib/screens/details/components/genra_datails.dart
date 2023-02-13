import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/components/build_genres_card.dart';
import 'package:movie_info/models/movie_model.dart';



// class GenraDetails extends StatelessWidget {
//   final Movie movie;
//   const GenraDetails({super.key, required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12),
//       child: Container(
//         height: 35,
//         child: ListView.builder(
//           itemCount: movie.genra.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => BuildGenresCard(
//             genre: movie.genra[index],
//           ),
//         ),
//       ),
//     );
//   }
// }
