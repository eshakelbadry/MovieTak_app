import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class TopRatedMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  int page = 1;
  int totalPages = 4;
  List<Movie> topRatedMoviesList = [];
  List<Movie>? results;
  Future<List<Movie>> fetchTopRatedMovies() async {
    try {
      //https://api.themoviedb.org/3/movie/top_rated?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US&page=1
      do {
        Uri url = Uri.parse(
            '$baseUrl/top_rated?api_key=$apiKey&language=en-US&page=$page');
        final http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          // print(data);
          page = data['page'];

          Response topRatedMovies = Response.fromJson(data);

          topRatedMoviesList.addAll(topRatedMovies.results!);
          page++;
        } else {
          throw Exception('Failed to fetch top rated movies');
        }
      } while (page <= totalPages);
    } on Exception catch (e) {
      print(e);
    }
    return topRatedMoviesList;
  }
}

  // Future<List<Movie>> fetchTopRatedMovies() async {
  //   Uri url = Uri.parse('$baseUrl/top_rated?api_key=$apiKey&language=en-US');
  //   final http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     // print(data);
  //     Response topRatedMovies = Response.fromJson(data);
  //     // List<Movie> movies =
  //     //     (data['results'] as List).map((e) => Movie.fromJson(e)).toList();
  //     // print(data['results'][0]['title']);
  //     final movies = topRatedMovies.results;
  //     // var results;
  //     return movies!;
  //   } else {
  //     throw Exception('Failed to fetch top rated movies');
  //   }
  // }

