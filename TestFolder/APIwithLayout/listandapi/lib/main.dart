import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Main API URL
  final String url = "https://www.mangaeden.com/api/list/0/";
  //Data list
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(url);
    print(response.body);

    setState(() {
      //Need to set state to use the data in the statefull widget.
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['manga'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manga Reader"),
      ),
      body: ListView.builder(
        itemCount: data== null?0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(data[index]['t']),
                        // Image.network(data[index]['im'] == null? "https://www.google.co.in/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F487303622160987555%2F&psig=AOvVaw2Kf4M5FzHv4NH_Hl3vpDpH&ust=1576679708936000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCMysrzvOYCFQAAAAAdAAAAABAD": "https://cdn.mangaeden.com/mangasimg/"+data[index]['im'])

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
