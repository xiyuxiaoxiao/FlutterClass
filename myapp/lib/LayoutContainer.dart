import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  final title;
  LayoutContainer({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${title}"),
      ),
      body: new LayoutButtonWidget(),
    );
  }
}

class LayoutButtonWidget extends StatefulWidget {
  _layoutButtonState createState() => new _layoutButtonState();
}

class _layoutButtonState extends State<LayoutButtonWidget> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _button(),
        // new Expanded() //Expanded 如果包裹 因为无限扩大 就会居中开始布局
        new Container(
          child: _content(),
        )
      ],
    );
  }

  Widget tapView(String text, int index) {
    return new GestureDetector(
      onTap: () => {
        this.setState(() {
          _selectIndex = index;
        })
      },
      child: new Container(
        decoration: new BoxDecoration(), // 加上装饰baoder后就可以点击内边距处响应
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: new Text(
          text,
          style: new TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget _button() {
    return new Container(
      decoration: new BoxDecoration(
          border: new Border.all(
        color: Colors.black,
      )),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tapView("Expanded填充", 0),
          tapView("Container", 1),
          tapView("聚集widgets", 2),
        ],
      ),
    );
  }

  Widget _content() {
    if (_selectIndex == 0) {
      return _rowExpanded();
    }
    if (_selectIndex == 1) {
      return _layoutContainer();
    }
    if (_selectIndex == 2) {
      return _gatherWidgets();
    }
    return null;
  }

  Widget _rowExpanded() {
    return new Row(
      children: <Widget>[
        new Container(
          color: Colors.orange[300],
          margin: const EdgeInsets.all(10),
          width: 100.0,
          height: 100.0,
        ),
        new Expanded(
          child: new Container(
            color: Colors.red[300],
            // margin: const EdgeInsets.all(40),
            height: 100.0,
          ),
        ),
        new Expanded(
          flex: 2, // 将剩余的填充按比例扩充 包括margin
          child: new Container(
            color: Colors.green[300],
            margin: const EdgeInsets.only(right: 5),
            height: 100.0,
          ),
        )
      ],
    );
  }

  Widget _layoutContainer() {
    final view = new Container(
      color: Colors.blue[500],
      padding: const EdgeInsets.all(40),
      width: 300.0,
      height: 300.0,
      transform: Matrix4.rotationZ(0.1),
      child: Text(
        "Hello World",
        style:
            Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
      ),
    );

    return new Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: view,
    );
  }
  
  Widget _gatherWidgets() {
    return  new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.black),
        new Icon(Icons.star, color: Colors.black),
      ],
    );
  }
}
