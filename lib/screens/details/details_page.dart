import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_info/models/movie_model.dart';


import 'components/body.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetailsBody(
        movie: movie,
      ),
    );
  }
}






// Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.only(
//             left: 15,
//           ),
//           child: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.keyboard_arrow_left,
//               color: Colors.black,
//               size: 30,
//             ),
//           ),
//         ),
//       ),
//     );