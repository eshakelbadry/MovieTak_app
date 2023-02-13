import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class UpComingMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  int page = 1;
  int totalPages = 4;
  List<Movie> upComingMoviesList = [];
  List<Movie>? results;
  Future<List<Movie>> fetchUpComingMovies() async {
    try {
      do {
        Uri url = Uri.parse(
            '$baseUrl/upcoming?api_key=$apiKey&language=en-US&page=$page');
        final http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          page = data['page'];

          Response moviesList = Response.fromJson(data);

          final movie = upComingMoviesList.addAll(moviesList.results!);
          page++;
        } else {
          throw Exception('Failed to fetch up coming movies');
        }
      } while (page <= totalPages);
    } on Exception catch (e) {
      print(e);
    }
    return upComingMoviesList;
  }}



////////////////////////////////////
  // Future<List<Movie>> fetchUpComingMovies() async {
  //   try {
  //     Uri url = Uri.parse('$baseUrl/upcoming?api_key=$apiKey&language=en-US');
  //     final http.Response response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       // print(data);
  //       Response upComingMovies = Response.fromJson(data);

  //       final movies = upComingMovies.results;
  //       // var results;
  //       return movies!;
  //     } else {
  //       throw Exception('Failed to fetch now Playing movies');
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  //   return upComingMoviesList;
  // }

