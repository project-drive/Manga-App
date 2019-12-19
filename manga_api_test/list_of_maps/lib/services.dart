

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'manga.dart';
 
// class Services {
//   static Future<List<Manga>> getPhotos() async {
//     try {
//       final response =
//           await http.get("https://jsonplaceholder.typicode.com/photos");
//       if (response.statusCode == 200) {
//         List<Album> list = parsePhotos(response.body);
//         return list;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
 
//   // Parse the JSON response and return list of Album Objects //
//   static List<Album> parsePhotos(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Album>((json) => Album.fromJson(json)).toList();
//   }
// }