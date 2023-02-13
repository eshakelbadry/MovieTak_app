import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/movie.dart';

class CastCrew extends StatelessWidget {
//  final Movie movie;
  final List casts;
  const CastCrew({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 17),
          child: Text(
            'Cast & Crew',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: 120,
            // color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(cast: casts[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class CastCard extends StatelessWidget {
  // final Movie movie;
  final Map cast;
  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 77,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            child: Image.asset(
              cast['image'],
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 5),
          Text(
            cast['orginalName'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            cast['movieName'],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
