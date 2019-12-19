import 'package:flutter/material.dart';
import './main.dart';
import './manga.dart';

class MangaThumb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String imglink = 'http://cdn.mangaeden.com/mangasimg/';

    return Center(
      child: FutureBuilder<MangaEden>(
        // future: me,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data.mangas[40].title,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.network(
                        imglink + snapshot.data.mangas[40].img,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
