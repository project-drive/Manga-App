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
  gridView(AsyncSnapshot<List<Manga>> snapshot) {
    //
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map((manga) {
          return GestureDetector(
            child: GridTile(
              child: MangaCell(manga),
            ),
          );
        }).toList(),
      ),
    );
  }

  circularProgress() {
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
                  if (snapshot.hasData) {
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
