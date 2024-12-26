
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppsRepository{

  static const String _statusUser = 'statusUser';
  static const String _urlPath = 'urlPath';

  Future<void> saveImage(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_urlPath, url);
  }

  Future<String?> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_urlPath);
  }

  Future<void> saveStatus(Map<String, dynamic> status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_statusUser, jsonEncode(status));
  }

  Future<String?> getStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_statusUser) ?? '';
  }

}