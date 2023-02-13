import 'package:flutter/material.dart';
import 'package:movie_info/cubits/app_cubit/app_cubit.dart';
import 'package:movie_info/cubits/popular_cubit/popular_cubit.dart';
import 'package:movie_info/cubits/similar_cubit/similar_cubit.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/movie_model.dart';
import 'package:movie_info/screens/details/details_page.dart';
import 'package:movie_info/screens/details_test.dart';
import 'package:movie_info/screens/home.dart';
import 'package:movie_info/screens/homeScreen/home_body.dart';
import 'package:movie_info/screens/homeScreen/home_layout.dart';
import 'package:movie_info/screens/search_screen/search.dart';
import 'package:movie_info/services/movies_details.dart';
import 'package:movie_info/services/nowPlaying_movies_service.dart';
import 'package:movie_info/services/popular_movies_service.dart';
import 'package:movie_info/services/search_movies_service.dart';
import 'package:movie_info/services/similar_movies_service.dart';
import 'package:movie_info/services/topRated_movies_service.dart';
import 'package:movie_info/services/upComing_movies_service.dart';
import 'package:movie_info/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'cubits/details_movies_cubit/details_movies_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/now_playing_cubit/now_playing_cubit.dart';
import 'cubits/search_cubit/search_cubit.dart';
import 'cubits/top_rated_cubit/top_rated_cubit.dart';
import 'cubits/up_coming_cubit/up_coming_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isDark = sharedPreferences.getBool('isDark') ?? true;
  checkConnectivity();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (_) => AppCubit(sharedPreferences, isDark),
        ),
        BlocProvider<PopularCubit>(
          create: (_) => PopularCubit(
            PopularMoviesService(),
          ),
        ),
        BlocProvider<TopRatedCubit>(
          create: (_) => TopRatedCubit(
            TopRatedMoviesService(),
          ),
        ),
        BlocProvider<NowPlayingCubit>(
          create: (_) => NowPlayingCubit(
            NowPlayingMoviesService(),
            // DetailsMoviesService(),
          ),
        ),
        BlocProvider<DetailsMoviesCubit>(
          create: (_) => DetailsMoviesCubit(
            DetailsMoviesService(),
          ),
        ),
        BlocProvider<UpComingCubit>(
          create: (_) => UpComingCubit(
            UpComingMoviesService(),
          ),
        ),
        BlocProvider<SimilarCubit>(
          create: (_) => SimilarCubit(
            SimilarMoviesService(),
          ),
        ),
        BlocProvider<SearchCubit>(
          create: (_) => SearchCubit(
            SearchMoviesService(),
          ),
        ),
      ],
      child: const MovieApp(),
    ),
  );
}

void checkConnectivity() async {
  var result = await Connectivity().checkConnectivity();
  print(result);
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: kAppBarBackgroundColor,
                  iconTheme: IconThemeData(color: Colors.white)),
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: kProgressIndicatorLightThemeColor
                  ),
              scaffoldBackgroundColor: kScaffoldBackgroundLightThemeColor,
              primaryColorLight: const Color.fromARGB(255, 0, 0, 0),
              textTheme: const TextTheme(
                // titleLarge: TextStyle(fontWeight: FontWeight.w600),
                bodyMedium: TextStyle(fontWeight: FontWeight.w600),
                bodyLarge: TextStyle(fontWeight: FontWeight.w600),
                bodySmall: TextStyle(fontWeight: FontWeight.w600),
              )),
          darkTheme: ThemeData(
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: kProgressIndicatorDarkThemeColor
            ),
            appBarTheme: const AppBarTheme(
                backgroundColor: kAppBarBackgroundColor,
                iconTheme: IconThemeData(color: Colors.white)),
            scaffoldBackgroundColor: kScaffoldBackgroundDarkThemeColor,
            textTheme: const TextTheme(
              headlineMedium: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          themeMode: BlocProvider.of<AppCubit>(context).isDark
              ? ThemeMode.light
              : ThemeMode.dark,
          home: HomeLayOut(),
        );
      },
    );
  }
}





// void main() {
//   runApp(const MovieApp());
// }

// class MovieApp extends StatelessWidget {
//   const MovieApp({super.key});
// // final Movie movie;
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // routes: {
//       //   'HomePage': (context) => HomePage(),
//       //   'DetailsPage': (context) => DetailsPage(movie: movie,)

//       // },
//       // initialRoute: 'HomePage',
//       home: HomePage(),
//     );
//   }
// }