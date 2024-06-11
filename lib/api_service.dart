import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<List<dynamic>> getCategories() async {
    // API'dan tüm kategorileri almak için bir istek yapar.
    final response = await http
        .get(Uri.parse('$baseUrl/categories.php')); //HTTP get isteği oluşturur.
    if (response.statusCode == 200) {
      //HTTP isteği başarılıysa 200 döndürür.
      final data = json.decode(response.body);
      return data['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> getMealsByCategory(String category) async {
    // Belirli bir kategorideki yemekleri almak için bir istek yapar.
    final response =
        await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<dynamic> getMealDetails(String id) async {
    // Belirli bir yemeğin detaylarını almak için bir istek yapar.
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'][0];
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
