import 'package:flutter/material.dart';
import 'package:movie_info/constants.dart';

import '../screens/seeMoreScreen/see_more_screen.dart';

class MoviesTypeAndSeeMoreButtonWidget extends StatelessWidget {
  MoviesTypeAndSeeMoreButtonWidget({
    super.key,
    required this.moviesType,
    required this.seeMorePageType,
    required this.width,
  });

  final double width;
  String moviesType;
  Widget seeMorePageType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 10, top: 12, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moviesType,
            style: const TextStyle(fontFamily: poppinsFont, fontSize: 20),
          ),
          // SizedBox(width: width * 0.3),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return seeMorePageType;
                },
              ));
            },
            child: Row(
              children: const [
                Text(
                  'See More',
                  style: TextStyle(
                    
                      fontFamily: poppinsFont,
                      fontSize: 15),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                
                  size: 17,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
