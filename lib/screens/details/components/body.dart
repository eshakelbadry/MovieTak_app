import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_info/models/movie_model.dart';
import 'package:movie_info/screens/details/components/rating_box.dart';

import 'cast.dart';
import 'duration_and_fav.dart';
import 'genra_datails.dart';

class DetailsBody extends StatelessWidget {
  final Movie movie;
  const DetailsBody({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: size.height * 0.38,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.4 - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        50,
                      ),
                    ),
                    image: DecorationImage(
                      image: AssetImage(''
                        // movie.backdrop,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                RatingBox(
                  size: size,
                  movie: movie,
                ),
                SafeArea(child: BackButton()),
              ],
            ),
          ),
          DurationAndFav(movie: movie),
          // GenraDetails(movie: movie),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Plot Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Text(''
              // movie.overview,
              // style: TextStyle(
              //   color: Colors.black.withOpacity(0.7),
              //   fontSize: 15,
              // ),
            ),
          ),
          // CastCrew(
          //   casts: movie.cast,
          // ),
        ],
      ),
    );
  }
}

// class PlotSummary extends StatelessWidget {
//   const PlotSummary({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
