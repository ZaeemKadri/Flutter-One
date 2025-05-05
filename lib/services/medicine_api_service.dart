import 'dart:convert';
import 'package:flutter_one/models/medicine_model.dart';
import 'package:http/http.dart' as http;

class MedicineApiService {
  final url = "https://api.prachinjadibuti.in/healthcare/medicine";

  Future<List<MedicineModel>> fetchMedicineInfo() async {
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        List data = json.decode(response.body);
        return data.map((item) => MedicineModel.fromJson(item)).toList();
      }
      else{
        throw Exception("Failed to load medicine info");
      }
    }
    catch(e){
      throw Exception("Error: $e");
    }
  }
}