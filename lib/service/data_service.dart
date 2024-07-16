import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  Future<List<dynamic>> fetchCategories() async {
    var url = 'https://yummie.glitch.me/dish-categories';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['data']['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

    Future<List<dynamic>> fetchPopulars() async {
    var url = 'https://yummie.glitch.me/dish-categories';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['data']['populars'];
    } else {
      throw Exception('Failed to load populars');
    }
  }

  Future<List<dynamic>> fetchSpecials() async {
    var url = 'https://yummie.glitch.me/dish-categories';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['data']['specials'];
    } else {
      throw Exception('Failed to load specials');
    }
  }
}
