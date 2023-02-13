import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/models/movie_model.dart';

class RatingBox extends StatelessWidget {
  final Movie movie;
  const RatingBox({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        height: 90,
        width: size.width * 0.9,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 50,
            //     offset: Offset(0, 5),
            //   ),
            // ]
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_outlined,
                  size: 28,
                  color: Colors.amber,
                ),
                Row(
                  children: [
                    Text(''
                        // '${movie.rating}',
                        // style: TextStyle(
                        //   fontSize: 15,
                        //   fontWeight: FontWeight.w500,
                        // ),
                        ),
                    Text(
                      '/10',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(''
                    // '${movie.numOfRatings}',
                    // style: TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.black.withOpacity(
                    //       0.6,
                    //     )),
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border,
                      size: 30,
                    ),
                  ),
                  // Text(
                  //   'Rate This',
                  //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  // )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.green.shade500),
                  child: Text(''
                      // '${movie.metascoreRating}',
                      // style: TextStyle(
                      //   fontSize: 13,
                      //   color: Colors.white,
                      // ),
                      ),
                ),
                Text(
                  'Metascore',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(''
                    // '${movie.criticsReview} critics reviews',
                    // style: TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.black.withOpacity(
                    //       0.6,
                    //     )),
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
