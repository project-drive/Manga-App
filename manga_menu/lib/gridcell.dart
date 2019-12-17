import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './manga.dart';

class MangaCell extends StatelessWidget {
  const MangaCell(this.manga);
  @required
  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ClipRect(
              child: FadeInImage.assetNetwork(
                placeholder: "images/no_image.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              manga.title,
              softWrap: true,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
