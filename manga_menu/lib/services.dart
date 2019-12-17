import 'package:http/http.dart' as http;
import 'dart:convert';
import './manga.dart';

class Services {
  static const String url = "https://www.mangaeden.com/api/list/0/";
  static Future<List<Manga>> getManga() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Manga> list = parseManga(response.body);
        return list;
      }
      else{
        throw Exception("Error");
      }
    } catch (e) {
      throw new Exception(e.toString());
    }
  }
  static List<Manga> parseManga(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Manga>((json) => Manga.fromJson(json)).toList();
  }
}
