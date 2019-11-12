import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_module/LayoutContainer.dart';
import 'package:flutter_module/DemoExampleClass.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        body: new Center(
          child: new RandomWords(),
        ),
      ),

      routes: <String, WidgetBuilder>{
        'path0': (BuildContext content) => LayoutContainer(title: '基本布局'),
        'path1': (BuildContext content) => DemoExampleClass(title: 'Demo练习'),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = [
    '基本布局', 'Demo练习'
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('学习'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext content, int index) {
        return _buildRow(index);
      },
      separatorBuilder: (BuildContext content, int index) {
        return new Divider();
      },
      itemCount: _suggestions.length,
    );
  }

  Widget _buildRow(int index) {
    String text = _suggestions[index];
    return new ListTile(
      title: new Text(
        text,
        style: _biggerFont,
      ),
      trailing: new Icon(Icons.arrow_forward_ios),
      onTap: () {
        setState(() {
          _pushLayoutSubView(index);
        });
      },
    );
  }

  // 跳转
  void _pushLayoutSubView(index) {
    Navigator.pushNamed(context, 'path${index}');
  }
}
