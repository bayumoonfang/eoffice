


import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var value;

  static Future<String> getUsername() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString("username");
  }

  static Future<String> getKaryawanNama() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString("karyawan_nama");
  }

  static Future<String> getKaryawanCabang() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString("karyawan_cabang");
  }

  static Future<String> getKaryawanJabatan() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString("karyawan_jabatan");
  }


  static Future<String> getKaryawanID() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString("karyawan_id");
  }


  static Future<int> getvalue() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getInt("value");
  }




}