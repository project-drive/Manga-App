import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './manga.dart';
import './services.dart';
import './gridcell.dart';

void main() => runApp(MangaMenu());

class MangaMenu extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MangaMenuState();
  }
}

class MangaMenuState extends State<MangaMenu> {
  //
  gridView(AsyncSnapshot <List<Manga>> snapshot){
    //
  }
  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Menu")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Manga>>(
                future: Services.getManga(),
                builder: (context, snapshot) {
                  //
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  //
                  if (snapshot.hasData){
                    //gridview
                    return gridView(snapshot);
                  }
                  return circularProgress();


                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
