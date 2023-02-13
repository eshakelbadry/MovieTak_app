import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String formatReleaseDate(String releaseDate) {
  try {
    return DateFormat("dd-MM-yyyy").format(DateTime.parse(releaseDate));
  } catch (e) {
    try {
      return DateFormat("dd-MM-yyyy").format(DateTime.tryParse(releaseDate)!);
    } catch (e) {
      return releaseDate;
    }
  }
}

class NoMoviesErrorWidget extends StatelessWidget {
  const NoMoviesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: height * 0.1),
        const Icon(Icons.error_outline_outlined, size: 40),
        SizedBox(height: height * 0.02),
        const Text('No Movies Was Found')
      ],
    );
  }
}





class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/moviepic.png',
      fit: BoxFit.fill,
    );
  }
}
