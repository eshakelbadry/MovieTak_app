import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class PopularMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  int page = 1;
  int totalPages = 4;
  List<Movie> popularMoviesList = [];
  List<Movie>? results;
  Future<List<Movie>> fetchPopularMovies() async {
    try {
      do {
        Uri url = Uri.parse(
            '$baseUrl/popular?api_key=$apiKey&language=en-US&page=$page');
        final http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          page = data['page'];
          // totalPages = data['total_pages'];
          Response moviesList = Response.fromJson(data);

          final movie = popularMoviesList.addAll(moviesList.results!);
          page++;
        } else {
          throw Exception('Failed to load popular movies');
        }
      } while (page <= totalPages);
    } on Exception catch (e) {
      print(e);
    }
    return popularMoviesList;
  }
}
  /////////////////////////////////
  // Future<List<Movie>> fetchPopularMovies() async {
  //   Uri url = Uri.parse('$baseUrl/popular?api_key=$apiKey&language=en-US');
  //   final http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     // print(data);
  //     Response moviesList = Response.fromJson(data);
  //     // List<Movie> movies =
  //     //     (data['results'] as List).map((e) => Movie.fromJson(e)).toList();
  //     // print(data['results'][0]['title']);
  //     final movies = moviesList.results;
  //     // var results;
  //     return movies!;
  //   } else {
  //     throw Exception('Failed to fetch movies');
  //   }
  // }

  ///////////////////////
//   Future<List<Movie>> fetchPopularMovies() async {
//     int page = 1;
//     int totalPages = 500;
//     List<Movie> movies = [];

//     while (page == null || page <= totalPages) {
//       Uri url = Uri.parse(
//           '$baseUrl/popular?api_key=$apiKey&language=en-US&page=$page');
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         Response moviesList = Response.fromJson(data);
//         // totalPages = moviesList.totalPages;
//         movies.addAll(moviesList.results!);
//         page++;
//       } else {
//         throw Exception('Failed to fetch movies');
//       }
//     }
//     return movies;
//   }


////////////////////////////////
// class MovieService {
//   final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
//   final String baseUrl = 'https://api.themoviedb.org/3/movie/';

//   Future<List<Movie>> fetchPopularMovies() async {
//     int page = 1;
//     int totalPages = 2;
//     List<Movie> movies = [];

//     while (page <= totalPages || totalPages == null) {
//       Uri url = Uri.parse(
//           '$baseUrl/popular?api_key=$apiKey&language=en-US&page=$page');
//       final response = await http.get(url);
//       // print(response.body);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         // totalPages = data['total_pages'];
//         movies.addAll(
//             (data['results'] as List).map((e) => Movie.fromJson(e)).toList());
//         // movies.addAll((data['results'] as List<dynamic>)
//         //     .map((e) => Movie.fromJson(e))
//         //     .toList());
//         page++;
//         // print(data['results']['title']);
//       } else {
//         throw Exception('Failed to fetch movies');
//       }
//     }

//     return movies;
//   }
// }

////////////////
// class MovieService {
//   String baseUrl = 'https://api.themoviedb.org/3/movie';
//   String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
//   Future<List<MovieModel>> getMovie() async {
//     // MovieModel ?movieData;
//     try {
//       Uri url =
//           Uri.parse('$baseUrl/popular?api_key=$apiKey&language=en-US&page=1');
//       http.Response response = await http.get(url);

//       if (response.statusCode == 200) {
//         String data = response.body;
//         var jsonData = jsonDecode(data);
//         // MoviesList moviesList = MoviesList.fromJson(jsonData);
//         List<MovieModel> MoList =
//             moviesList.moviesList.map((e) => MovieModel.fromjson(e)).toList();
//         return MoList;
//         // movieData = MovieModel.fromjson(data);
//       } else {
//         print('status code =${response.statusCode}');
//       }
//     } catch (ex) {
//       print(ex);
//     }
    
//     // return movieData;
//   }
// }


