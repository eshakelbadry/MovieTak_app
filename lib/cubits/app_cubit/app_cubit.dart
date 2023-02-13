import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/shared_preference.dart';
import 'package:movie_info/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../shared_preference.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.sharedPreferences, this.isDark) : super(AppInitial());
  final SharedPreferences sharedPreferences;
  bool isDark;

  void changeAppMode() {
    isDark = !isDark;
    sharedPreferences.setBool('isDark', isDark);
    emit(AppChangeModeState());
  }

  // Future<void> initDarkMode() async {
  //   isDark = sharedPreferences.getBool('isDark') ?? true;
  //   emit(AppChangeModeState());
  // }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    print(result);
  }
}
