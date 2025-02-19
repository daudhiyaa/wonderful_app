import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// ** TOKEN MANAGEMENT **
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}

Future<void> clearToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
}

// ** USER MANAGEMENT **
Future<void> saveUserData(Map<String, dynamic> userData) async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(userData);
  await prefs.setString('user_data', jsonString);
}

Future<Map<String, dynamic>?> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('user_data');
  if (jsonString != null) {
    return jsonDecode(jsonString);
  }
  return null;
}

Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_data');
}

// ** ROLE MANAGEMENT **
Future<void> saveUserRole(String role) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_role', role);
}

Future<String?> getUserRole() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_role');
}

Future<void> clearUserRole() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_role');
}
