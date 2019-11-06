import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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
    print("走之前\n");
    _httpTest();
    print("走之后\n");
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

  /*
    打印结果: "走之前 ---- 0 ---- 走之后 ---- 1"
    在await的时候 异步阻塞了当前函数 外部调用函数的会执行函数后面的内容 
  */
  actionHttp() {
    print("走之前\n");
    _httpTest();
    print("走之后\n");
  }

  void _httpTest() async {
    print("0\n");
    var response = await http
        .get('http://101.200.200.61/o2oNewApiRun/api.php?act=getCompanyList');
    print("1\n");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print("Number of books about http: $jsonResponse.");
    } else {
      // print("Request failed with status: ${response.statusCode}.");
    }
  }
}
