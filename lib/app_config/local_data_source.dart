import 'package:poker_project/app_config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  LocalDataSource._privateConstructor() {
    _initPref();
  }

  static final LocalDataSource _instance =
      LocalDataSource._privateConstructor();

  factory LocalDataSource() {
    return _instance;
  }

  static const String _currentThemeKey = "current_theme_key";
  SharedPreferences? _sharedPreferences;

  _initPref() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<String> getCurrentTheme() async {
    await _initPref();
    return _sharedPreferences!.containsKey(_currentThemeKey)
        ? _sharedPreferences!.getString(_currentThemeKey)!
        : AppConfig.defaultTheme;
  }

  Future<bool> setCurrentTheme(String theme) async {
    await _initPref();
    return _sharedPreferences!.setString(_currentThemeKey, theme);
  }
}
