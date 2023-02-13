import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class SearchMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/search/movie/';

  int page = 1;
  int totalPages = 6;
  // List<Movie> movie = [];
  List<Movie> movies = [];
  List<Movie>? results;
  Future<List<Movie>> fetchSearchedMovies({required String movieName}) async {
    try {
      do {
        Uri url = Uri.parse(
            'https://api.themoviedb.org/3/search/movie?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US&query=$movieName&page=$page');
        final http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          page = data['page'];
        
          totalPages = data['total_pages'];
          Response moviesSearchList = Response.fromJson(data);
          // List<Movie> movies =
          //     (data['results'] as List).map((e) => Movie.fromJson(e)).toList();
          // print(data['results'][0]['title']);
          movies.addAll(moviesSearchList.results!);
          
          page++;
        } else {
          throw Exception('Failed to fetch searched movie');
        }
      } while (page <= totalPages);
    } on Exception catch (e) {
      print(e);
    }
    return movies;
  }
}




// https://api.themoviedb.org/3/search/movie?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US&query=spider&include_adult=false
  // Future<List<Movie>> fetchSearchedMovies({required String movieName}) async {
  //   Uri url = Uri.parse(
  //       'https://api.themoviedb.org/3/search/movie?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US&query=$movieName&include_adult=false');
  //   final http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     print(data);
  //     Response moviesList = Response.fromJson(data);
  //     // print(moviesList);
  //     final movies = moviesList.results;
  //     // var results;
  //     return movies!;
  //   } else {
  //     throw Exception('Failed to fetch searched movie');
  //   }
  // }
  /////////////////