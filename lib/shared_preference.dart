import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // static SharedPreferences sharedPreferences;

//  =PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> putBoolean({required String key, required bool value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(key, value);
  }

  bool? getBoolean({required String key})  {
    SharedPreferences sharedPreferences =  SharedPreferences.getInstance() as SharedPreferences;
    return sharedPreferences.getBool(key);
  }
}
