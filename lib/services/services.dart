import 'dart:developer';
import 'models/movie_list.dart';
import 'package:http/http.dart' as http;


class HttpServices {
   static const String apiKey = "5cc19f80"; 
  static const String baseUrl = "https://omdbapi.com/";

  static Future getMovies(String query,page) async {
    try {
      final response = await http.get(
        Uri.parse(
          "$baseUrl?apikey=$apiKey&s=$query&page=$page",
        ),        
      );
      if (response.statusCode == 200) {
        return searchListFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }
}