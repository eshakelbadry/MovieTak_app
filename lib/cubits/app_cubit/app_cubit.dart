import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
