import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

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

    return
        // Column(
        //   children: [
        //     SizedBox(height: height * 0.15),
        //     Image.asset(
        //       'assets/images/internet_error.png',
        //       fit: BoxFit.fitHeight,
        //     ),
        //     SizedBox(height: height * 0.07),
        //     const Text('No Movies Found',
        //         style: TextStyle(
        //             // color: Colors.black,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w300,
        //             fontFamily: poppinsFont)),
        //   ],
        // );
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.03),
        const Icon(Icons.error_outline_outlined, size: 40),
        const SizedBox(height: 15),
        const Text('No Movies Found'),
        // const SizedBox(height: 10),
      ],
    );
  }
}

class NoSimilarMoviesErrorWidget extends StatelessWidget {
  const NoSimilarMoviesErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: height * 0.03),
        const Icon(Icons.error_outline_outlined, size: 40),
        const SizedBox(height: 8),
        const Text('No Similar Movies Found'),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ErrorPosterImageWidget extends StatelessWidget {
  const ErrorPosterImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splashthree.jpg',
      fit: BoxFit.fill,
    );
  }
}

class ErrorBackdropImageWidget extends StatelessWidget {
  const ErrorBackdropImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/moviepic.png',
      fit: BoxFit.fill,
    );
  }
}

class NoInternetErrorWidget extends StatelessWidget {
  const NoInternetErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: height * 0.1),
          Image.asset(
            'assets/gifs/network_error_animation.gif',
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: height * 0.05),
          const Text('Can\'t connect .. Check internet connection',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: poppinsFont)),
        ],
      ),
    );
  }
}




// class BeforeLoadingImageWidget extends StatelessWidget {
//   const BeforeLoadingImageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset('assets/gifs/loading_animation.gif', fit: BoxFit.fill);
//   }
// }