import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/LayoutContainer.dart';
import 'package:myapp/DemoExampleClass.dart';
import 'package:myapp/GridViewClass.dart';

void main() {
  // 可以查看布局结构
  // debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      // theme: new ThemeData(
      //   primaryColor: Colors.red
      // ),
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('Welcome to Flutter'),
        // ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  var _suggestions = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    final list0 = {
      'title': '基本布局',
      'container': (title) {
        return new LayoutContainer(title: title);
      } ,
    };
    final list1 = {
      'title': 'Demo练习',
      'container': (title) => new DemoExampleClass(title: title),
    };
    final list2 = {
      'title': 'GridView',
      'container': (title) => new GridviewClass(title: title),
    };

    // final arr = [list0, list1, list2];
    // for (var obj in arr) {
    //   _suggestions.add(obj);
    // }
    _suggestions = [list0, list1, list2];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext content, int index) {
        return _buildRow(_suggestions[index]);
      },
      separatorBuilder: (BuildContext content, int index) {
        return new Divider();
      },
      itemCount: _suggestions.length,
    );
    // return new ListView(
    //   padding: const EdgeInsets.all(16.0),
    //   children: _suggestions,
    // );
  }

  Widget _buildRow(final pair) {
    return new ListTile(
      title: new Text(
        pair['title'],
        style: _biggerFont,
      ),
      trailing: new Icon(Icons.arrow_forward_ios),
      onTap: () {
        setState(() {
          _pushLayoutSubView(pair);
        });
      },
    );
  }

  // 跳转
  void _pushLayoutSubView(obj) {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        return obj['container'](obj['title']);
      },
    ));
  }
}
