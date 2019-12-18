import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response = await http.get('https://www.mangaeden.com/api/list/0/');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int total;
  final List manga;

  Post({this.total, this.manga});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      total: json['total'],
      manga: json['manga'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga Reader(PD)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Manga Reader(PD)'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(snapshot.data.total, (index) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 180,
                              height: 180,
                              child: snapshot.data.manga[index]['im'] == null
                                  ? Image.asset('images/cnf.jpg')
                                  : Image.network(
                                      'https://cdn.mangaeden.com/mangasimg/' +
                                          snapshot.data.manga[index]['im'])),
                          Container(
                              child: Text(snapshot.data.manga[index]['t'])),
                        ],
                      ),
                    );
                  }),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// return ListView.builder(
//                   itemCount: snapshot.data.total,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(child: Column(
//                       children: <Widget>[
//                         Text(snapshot.data.manga[index]['t']),
//                         snapshot.data.manga[index]['im'] == null? Image.asset('images/cnf.jpg'):Image.network('https://cdn.mangaeden.com/mangasimg/'+snapshot.data.manga[index]['im'])

//                       ],
//                     ),
//                     );
//                   },
//                 );
