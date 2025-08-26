import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository {
  static const _keyShowIntro = 'show_intro';
  final SharedPreferences _prefs;

  SettingRepository(this._prefs);

  static Future<SettingRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SettingRepository(prefs);
  }

  Future<bool> getShowIntro() =>
      Future.value(_prefs.getBool(_keyShowIntro) ?? true);

  Future<void> setShowIntro(bool value) => _prefs.setBool(_keyShowIntro, value);
}
