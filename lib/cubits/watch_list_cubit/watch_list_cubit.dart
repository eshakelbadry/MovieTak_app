import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'watch_list_state.dart';

// class WatchListCubit extends
// Cubit<WatchListState>
// {
//   WatchListCubit() : super(WatchListInitial());

//   addMovieToWatchList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

// prefs.setStringList('favorite', <String> []);
//   }
// //  void addMovie(String title, String releaseDate) {
// //     emit([...state, {'title': title, 'releaseDate': releaseDate}]);
// //   }

// }

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit(this._prefs) : super(WatchListInitial());

  SharedPreferences _prefs;
  final List<Movie> movies = [];
  Future<void> loadWatchList() async {
    emit(WatchListLoading());
    _prefs = await SharedPreferences.getInstance();
    final watchListIds = _prefs.getStringList('watchList') ?? [];
    final watchList = watchListIds.map(int.parse).toList();
    if (watchList.isNotEmpty) {
      emit(WatchListFetchSuccess(
          watchList.map((id) => movies.firstWhere((m) => m.id == id)).toList(),
          movies: []));
    } else {
      emit(WatchListFetchFailure());
    }
  }

  Future<void> addToWatchList(Movie movie) async {
    emit(WatchListLoading());
    final watchList =
        (_prefs.getStringList('watchList') ?? []).map(int.parse).toList();
    if (watchList.contains(movie.id)) {
      emit(WatchListAddMovieFailure());
    } else {
      watchList.add(movie.id);
      _prefs.setStringList(
          'watchList', watchList.map((id) => id.toString()).toList());
      emit(WatchListAddMovieSuccess());
    }
  }

  Future<void> deleteMovieFromWatchList(int movieId) async {
  final watchList = (await _prefs.getStringList('watch_list') ?? [])
      .map((id) => int.parse(id))
      .toList();
  if (watchList.contains(movieId)) {
    watchList.remove(movieId);
    await _prefs.setStringList('watch_list', watchList.map((id) => id.toString()).toList());
    emit(WatchListDeleteMovieSuccess());
  } else {
    emit(WatchListDeleteMovieFailure());
  }
}
}
// n the FavoriteScreen and MovieDetailsScreen, make sure to call the loadFavorites method when the screen is first created.
// dart
// Copy code
// class FavoriteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     context.bloc<FavoriteCubIit>().loadFavorites();
//     return BlocBuilder<FavoriteCubit, List<Movie>>(
//       builder: (context, movies) {
//         return ListView.builder(
//           itemCount: movies.length,
//           itemBuilder: (context, index) {
//             final movie = movies[index];
//             return ListTile(
//               leading: Image.network(movie.posterUrl),
//               title: Text(movie.title),
//               subtitle: Text(movie.releaseDate),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class MovieDetailsScreen extends StatelessWidget {
//   final Movie movie;

//   MovieDetailsScreen({Key key, this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     context.bloc<FavoriteCubit>().loadFavorites();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(movie.title),
//       ),
//       body: Column(
//         children: [
//           Image.network(movie.posterUrl),
//           Text(movie.title),
//           Text(movie.releaseDate),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               final favoriteCubit =
//                   context.bloc<FavoriteCubit>();
//               if (favoriteCubit.state.contains(movie)) {
//                 favoriteCubit.removeFromFavorites(movie);
//               } else {
//                 favoriteCubit.addToFavorites(movie

// kefywu@decabg.eu
// continue
// );
// }
// },
// ),
// ],
// ),
// );
// }
// }

// vbnet
// Copy code

// This code uses shared preferences to persist the list of favorite movies. When the `loadFavorites` method is called, it retrieves the list of favorite movie IDs from shared preferences, and emits the corresponding list of movies to the `BlocBuilder`. When a movie is added to or removed from favorites, the corresponding method updates the list of movies in the cubit's state, and also updates the shared preferences with the new list of favorite movie IDs.

// kefywu@decabg.eu
// write favorite cubit states
// In the Flutter Bloc library, the state of a cubit is represented by a class that extends Cubit. In this case, the state of the FavoriteCubit is a list of Movie objects that represent the favorite movies.

// Here's the definition of the FavoriteCubit class:

// dart
// Copy code
// class FavoriteCubit extends Cubit<List<Movie>> {
//   FavoriteCubit() : super([]);

//   SharedPreferences _prefs;

//   Future<void> loadFavorites() async {
//     _prefs = await SharedPreferences.getInstance();
//     final favoriteIds = _prefs.getStringList('favorites') ?? [];
//     emit(favoriteIds.map((id) => movies.firstWhere((m) => m.id == id)).toList());
//   }

//   void addToFavorites(Movie movie) async {
//     emit([...state, movie]);
//     _prefs.setStringList('favorites', state.map((m) => m.id).toList());
//   }

//   void removeFromFavorites(Movie movie) async {
//     emit(state.where((m) => m.id != movie.id).toList());
//     _prefs.setStringList('favorites', state.map((m) => m.id).toList());
//   }
// }
