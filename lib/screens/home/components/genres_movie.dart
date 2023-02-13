// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:movie_info/components/build_genres_card.dart';

// class Genres extends StatefulWidget {
//   const Genres({super.key});

//   @override
//   State<Genres> createState() => _GenresState();
// }

// class _GenresState extends State<Genres> {
//   List<String> genres = [
//     'Action',
//     'Crime',
//     'Comedy',
//     'Drama',
//     'Horror',
//     'Animation',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       child: ListView.builder(
//         itemCount: genres.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) => BuildGenresCard
        

//         (genre: genres[index]),

//       ),
//     );
//   }
// }
