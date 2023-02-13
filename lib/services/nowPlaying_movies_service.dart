import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class NowPlayingMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  int page = 1;
  int totalPages = 4;
  List<Movie> nowPlayingMoviesList = [];
  List<Movie>? results;


  Future<List<Movie>> fetchNowPlayingMovies() async {
    try {
      do {
        Uri url = Uri.parse(
            '$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=$page');
        final http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          page = data['page'];

          Response moviesList = Response.fromJson(data);

          final movie = nowPlayingMoviesList.addAll(moviesList.results!);
          page++;
        } else {
          throw Exception('Failed to fetch now playing movies');
        }
      } while (page <= totalPages);
    } on Exception catch (e) {
      print(e);
    }
    return nowPlayingMoviesList;
  }}

  
//https://api.themoviedb.org/3/movie/now_playing?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US&page=1
  // Future<List<Movie>> fetchNowPlayingMovies() async {
  //   try {
  //     Uri url =
  //         Uri.parse('$baseUrl/now_playing?api_key=$apiKey&language=en-US');
  //     final http.Response response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       // print(data);
  //       Response nowPlayingMovies = Response.fromJson(data);

  //       final movies = nowPlayingMovies.results;
  //       // print(movies);
  //       return movies!;
  //     } else {
  //       throw Exception('Failed to load now Playing movies');
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  //   return nowPlayingMoviesList;
  // }

