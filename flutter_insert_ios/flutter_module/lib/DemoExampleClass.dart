import 'package:flutter/material.dart';

class DemoExampleClass extends StatelessWidget {
  final title;
  DemoExampleClass({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${title}"),
      ),
      body: _row(),
    );
  }

  Widget _row() {
    return new ListView(
      children: <Widget>[
        _titleSection(),
        _buttonSection(),
        _textSection(),
      ],
    );
  }

  Widget _titleSection() {
    return new Container(
      decoration: _decoration,
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "Oeschinen Lake Campground",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  "Kandersteg, Switzerland",
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return new Container(
      margin: new EdgeInsets.all(10),
      padding: new EdgeInsets.all(20),
      decoration: _decoration,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column buildButtonColumn(IconData icon, String label) {
    return new Column(
      children: <Widget>[
        new Icon(
          icon,
          color: Colors.blue,
        ),
        new Text(
          label,
          style: new TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _textSection() {
    return new Container(
      margin: new EdgeInsets.all(10),
      padding: new EdgeInsets.all(32),
      decoration: _decoration,
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. 
        Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. 
        A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, 
        leads you to the lake, which warms to 20 degrees Celsius in the summer. 
        Activities enjoyed here include rowing, and riding the summer toboggan run.
        
        ''',
      ),
    );
  }

  BoxDecoration _decoration = new BoxDecoration(
    border: new Border.all(
      color: Colors.white,
      width: 0,
    ),
  );
}
