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
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tapView("Expanded填充", 0),
                tapView("Container", 1),
                tapView("聚集widgets", 2),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tapView("Stack重叠", 3),
                tapView("Card和圆角", 4),
              ],
            ),
          ],
        ));
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
    if (_selectIndex == 3) {
      return _stackWidget();
    }
    if (_selectIndex == 4) {
      return _cardWidget();
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
    return new Row(
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

  // 后面的依次在前面的上面
  Widget _stackWidget() {
    var stack = new Stack(
      alignment: const Alignment(1, 1),
      children: <Widget>[
        new Container(
          width: 200,
          height: 200,
          child: new Image.asset(
            'images/flow/pic0.jpg',
            fit: BoxFit.fill,
          ),
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.green),
          width: 70,
          height: 70,
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.black),
          padding: new EdgeInsets.all(5),
          child: new Text(
            'Mia B',
            style: new TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        )
      ],
    );

    return stack;
  }

  Widget _cardWidget() {
    return new SizedBox(
      width: 200,
      height: 200,
      child: new Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        elevation: 24,

        // 圆角会被遮挡住 因此对card添加包裹设置内边距  下面的ClipRRect 可以处理超出的内容
        child: new Container(
          padding: new EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: new Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
