import 'package:flutter/material.dart';
import './manga.dart';
import './menudata.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   State<StatefulWidget> createState(){
//     return MyAppState();
//   }  
// }

// class MyAppState extends State<MyApp>{
//     @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Menu"),
//         ),
//       // body: Services(),
//       ),
//     );
//   }
// }
// }

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<MangaEden> fetchManga() async {
  final response = await http.get('https://www.mangaeden.com/api/list/0/');


  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return MangaEden.fromJson(json.decode(response.body));

    // MangaEden mE = new MangaEden.fromJson(json.decode(response.body));
    // print(mE.total.toString());
    // print(mE.mangas[0].title);
  
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// class Post {
//   final String id;
//   final String title;
//   final String image;

//   Post({this.id, this.title, this.image});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['manga'][49]['i'],
//       title: json['manga'][49]['t'],
//       image: json['manga'][49]['im'],
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<MangaEden> me;
  Future<Manga> m;

  @override
  void initState() {
    super.initState();
    me = fetchManga();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: MangaThumb(),
      ),
    );
  }
}

// Center(
//           child: FutureBuilder<MangaEden>(
//             future: me,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 print(snapshot.data);
//                 return Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                        Text(
//                          snapshot.data.mangas[40].title,
//                        ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                            Image.network(
//                               imglink+snapshot.data.mangas[40].img,
//                            ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),