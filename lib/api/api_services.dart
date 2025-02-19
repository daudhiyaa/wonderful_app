import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wonderful_app/api/api_endpoints.dart';

class ApiService {
  Future<Map<String, dynamic>> getUsers() async {
    final url = Uri.parse(ApiEndpoints.baseUrl);

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user data: ${response.body}');
    }
  }
}
