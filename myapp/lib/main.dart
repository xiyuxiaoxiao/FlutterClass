import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:myapp/LayoutContainer.dart';
import 'package:myapp/DemoExampleClass.dart';
import 'package:myapp/GridViewClass.dart';
import 'package:myapp/MaterialInteractionClass.dart';
import 'package:myapp/TextFieldClass.dart';

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

      routes: <String, WidgetBuilder>{
        'path0': (BuildContext content) => LayoutContainer(title: '基本布局'),
        'path1': (BuildContext content) => DemoExampleClass(title: 'Demo练习'),
        'path2': (BuildContext content) => GridviewClass(title: 'GridView'),
        'path3': (BuildContext content) => TextFieldClass(title: '文本框'),
        'path4': (BuildContext content) => MaterialInteractionClass(title: 'Material组件交互'),
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
    '基本布局', 'Demo练习', 'GridView', '文本框', 'Material组件交互',
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
    // return new ListView(
    //   padding: const EdgeInsets.all(16.0),
    //   children: _suggestions,
    // );
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

    // Navigator.of(context).push(new MaterialPageRoute(
    //   builder: (context) {
    //     return DemoExampleClass(title: 'Demo练习');
    //   },
    // ));
  }
}
