import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_details.dart';


class DetailsMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';

  //  List<Movie> detailsMovies=[];

  ///https://api.themoviedb.org/3/movie/315162?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US
  Future<MovieDetails> fetchDetailsMovies({required int id}) async {
    Uri url = Uri.parse('$baseUrl/$id?api_key=$apiKey&language=en-US');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print(data);
      final detailsMovies = MovieDetails.fromJson(data);

      return detailsMovies;
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }

  Future<List<Genres>?> fetchGenresMovies({required int id}) async {
    Uri url = Uri.parse('$baseUrl/$id?api_key=$apiKey&language=en-US');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final detailsMovies = MovieDetails.fromJson(data);
      // print(detailsMovies.genres);
      return detailsMovies.genres;
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }
}
