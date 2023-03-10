class Response {
  late int page;
  List<Movie>? results;
  late int totalPages;
  late int totalResults;

  Response(
      {required this.page,
      this.results,
      required this.totalPages,
      required this.totalResults});

  Response.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) page = json["page"];
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Movie.fromJson(e)).toList();
    }
    if (json["total_pages"] is int) totalPages = json["total_pages"];
    if (json["total_results"] is int) totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["page"] = page;
    if (results != null) {
      data["results"] = results!.map((e) => e.toJson()).toList();
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final String poster;
  final String backdrop;
  final String overview;
  final int votingCount;
  final num votingAverage;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.poster,
    required this.backdrop,
    required this.overview,
    required this.votingCount,
    required this.votingAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      poster: json['poster_path'] ?? '',
      backdrop: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      votingCount: json['vote_count'] ?? '',
      votingAverage: json['vote_average'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['poster_path'] = poster;
    data['backdrop_path'] = backdrop;
    data['overview'] = overview;
    data['vote_count'] = votingCount;
    data['vote_average'] = votingAverage;
    return data;
  }
}



// class MovieModel {
//   final int id, year, numOfRatings, page;
//   final double rating;
//   // final List<String> genra;
//   final String plot, title, poster, backdrop;
//   // final List<Map> cast;

//   MovieModel({
//     required this.page,
//     required this.poster,
//     required this.backdrop,
//     required this.title,
//     required this.id,
//     required this.year,
//     required this.numOfRatings,
//     required this.rating,
//     // required this.genra,
//     required this.plot,
//     //  required this.cast,
//   });

//   factory MovieModel.fromjson(dynamic jsonData) {
//     // var jsonData = data['results'];
//     return MovieModel(
//       poster: jsonData['poster_path'],
//       backdrop: jsonData['backdrop_path'],
//       title: jsonData['original_title'],
//       id: jsonData['id'],
//       year: jsonData['release_date"'],
//       numOfRatings: jsonData['vote_count'],
//       rating: jsonData['vote_average'],
//       plot: jsonData['"overview"'],
//       page: jsonData["page"],
//     );
//   }
//   @override
//   String toString() {
//     return 'name=$title ratingsnum=$numOfRatings';
//   }
// }
