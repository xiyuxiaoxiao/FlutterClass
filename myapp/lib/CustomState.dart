import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
          icon: (_isFavorited
              ? new Icon(Icons.star)
              : new Icon(Icons.star_border)),
          color: Colors.red[500],
          onPressed: _toggleFavorite,
        ),
        new Container(
          width: 18,
          child: new Text('${_favoriteCount}'),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}
