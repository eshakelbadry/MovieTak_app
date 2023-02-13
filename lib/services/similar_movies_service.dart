import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class SimilarMoviesService {
  final String apiKey = '2b87897c4f0f495993d86da3f6994e0a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
//  late int id;
  List<Movie> similarMoviesList = [];
  //https://api.themoviedb.org/3/movie/811656/similar?api_key=2b87897c4f0f495993d86da3f6994e0a&language=en-US
  Future<List<Movie>> fetchSimilarMovies({required int id}) async {
    Uri url = Uri.parse('$baseUrl/$id/similar?api_key=$apiKey&language=en-US');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print(data);
      Response similarMovies = Response.fromJson(data);
    
      final movies = similarMovies.results;
      // var results;
      return movies!;
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }
}
