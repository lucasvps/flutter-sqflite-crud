import 'package:crud_sqflite/app/interfaces/shared_local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorage implements ISharedLocalStorage {

  
  @override
  Future delete(String key) async {
    var sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  @override
  Future get(String key) async {
    var sharedPreferences =  await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  @override
  Future put(String key, value) async {
    var sharedPreferences =  await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    }
  }
}
