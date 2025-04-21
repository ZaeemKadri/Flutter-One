import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_one/models/character_info.dart';

class ApiService {
  final String baseUrl = "https://hp-api.onrender.com/api/characters"; // API URL

  Future<List<CharacterInfo>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        return data.map((item) => CharacterInfo.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load characters");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
