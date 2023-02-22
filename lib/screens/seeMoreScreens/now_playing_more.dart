import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

import '../../cubits/now_playing_cubit/now_playing_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/popular_cubit/popular_cubit.dart';

import '../../cubits/top_rated_cubit/top_rated_cubit.dart';
import '../../cubits/up_coming_cubit/up_coming_cubit.dart';
import '../../helper.dart';
import '../detailsScreen/details_screen.dart';

/////////////////////////////////////////////////
//see more now playing page
class SeeMoreNowPlayingPage extends StatelessWidget {
  const SeeMoreNowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<NowPlayingCubit, NowPlayingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<NowPlayingCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('NowPlaying Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.nowPlayingMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.nowPlayingMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String nowPlayingPosterUrl =
                            cubit.nowPlayingMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: cubit.nowPlayingMoviesList != null &&
                                        nowPlayingPosterUrl.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$basePicturesUrl$nowPlayingPosterUrl',
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) {
                                          return const ErrorPosterImageWidget();
                                        },
                                      )
                                    : const ErrorPosterImageWidget()),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.nowPlayingMoviesList[index].id);
                              },
                            ));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}





