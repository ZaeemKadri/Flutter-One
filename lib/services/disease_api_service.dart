import 'package:flutter_one/models/disease_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DiseaseApiService{
  final url = "https://api.prachinjadibuti.in/healthcare/disease";

  Future<List<DiseaseInfo>> fetchDiseaseInfo() async {
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        List data = json.decode(response.body);
        return data.map((item) => DiseaseInfo.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load characters");
      }
    }
    catch (e){
      throw Exception("Error: $e");
    }
  }
}