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
//  popular see more page

class SeeMorePopularPage extends StatelessWidget {
  const SeeMorePopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<PopularCubit>(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 25),
              ),
              automaticallyImplyLeading: false,
              title: const Text('Popular Movies'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cubit.popularMoviesList.isEmpty
                  ? const NoMoviesErrorWidget()
                  : GridView.builder(
                      itemCount: cubit.popularMoviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        String popularPosterUrl =
                            cubit.popularMoviesList[index].poster;

                        return GestureDetector(
                          child: Container(
                            // height: height * 0.33,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: cubit.popularMoviesList != null &&
                                      popularPosterUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          '$basePicturesUrl$popularPosterUrl',
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) {
                                        return const ErrorPosterImageWidget();
                                      },
                                    )
                                  : const ErrorPosterImageWidget(),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    id: cubit.popularMoviesList[index].id);
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