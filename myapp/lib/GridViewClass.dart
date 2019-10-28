import 'package:flutter/material.dart';

class GridviewClass extends StatelessWidget {
  final title;
  GridviewClass({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: _buildGrid(),
      ),
    );
  }

  Widget _buildGrid() {
    // return GridView.extent(
    //   maxCrossAxisExtent: 150, // 根据宽度自动规划一行能放几个

    //   padding: new EdgeInsets.all(10),
    //   mainAxisSpacing: 20,
    //   crossAxisSpacing: 20,
    //   childAspectRatio: 1/1.3,
    //   children: _buildGridList(30),
    // );

    return GridView.count(
      crossAxisCount: 2, // 控制列数
      
      padding: new EdgeInsets.all(10),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1/1.3,
      children: _buildGridList(30),
    );
  }

  List<Container> _buildGridList(count) {
    return new List<Container>.generate(count, (int index) {
      int i = index % 9;
      return new Container(
          color: Colors.orange[200],
          child: new Image.asset(
            'images/flow/pic${i}.jpg', //images子文件夹中的图片 也需要将路径单独引入pubspec.yaml中
            fit: BoxFit.fill,
          ));
    });
  }
}
