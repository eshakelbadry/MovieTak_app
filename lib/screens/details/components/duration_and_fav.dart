import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/models/movie_model.dart';



class DurationAndFav extends StatelessWidget {
  const DurationAndFav({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(''
                      // '${movie.year}',
                      // style: TextStyle(
                      //     fontSize: 13, color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'PG-12',
                      style: TextStyle(
                          fontSize: 13, color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '2h 32min',
                      style: TextStyle(
                          fontSize: 13, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
