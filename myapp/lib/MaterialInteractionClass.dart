// Material 交互组件
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaterialInteractionClass extends StatefulWidget {
  final title;
  MaterialInteractionClass({Key key, @required this.title}) : super(key: key);

  MaterialInteractionClassState createState() =>
      MaterialInteractionClassState(title: title);
}

class MaterialInteractionClassState extends State<MaterialInteractionClass> {
  final title;

  bool check = false; //复选框 值
  int _dropdownButtonValue = 0;
  int _radioValue = 0;
  double _slideValue = 0.2;
  bool _switchValue = true;

  MaterialInteractionClassState({Key key, this.title}) : super();

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${title}"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20),
        child: new ListView(
          children: <Widget>[
            Row(children: <Widget>[
              _checkBox(),
            ]),
            _checkboxListTile(),
            Row(children: <Widget>[
              _dropdownButton(),
              SizedBox(width: 40),
              _flatButton(),
              SizedBox(width: 40),
              _flatIconButton(),
            ]),
            Row(
              children: <Widget>[
                _raisedButton(),
                _raisedCircleButton(),
                Text('   IconButton:'),
                _iconButton(),
              ],
            ),
            _radioGroup(),
            _radioListTileColumn(),
            _slide(),
            _slideAdaptive(),
            Row(
              children: <Widget>[
                _switch(),
                SizedBox(width: 40),
                _switchAdaptive(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('FloatingAction'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.green,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.navigation),
      //   backgroundColor: Colors.green,
      // ),
    );
  }

  Widget _checkBox() {
    return Checkbox(
      value: this.check,
      activeColor: Colors.blue,
      onChanged: (bool val) {
        // val 是布尔值
        this.setState(() {
          this.check = !this.check;
        });
      },
    );
  }

  Widget _checkboxListTile() {
    return new CheckboxListTile(
      secondary: const Icon(Icons.shutter_speed),
      title: const Text('硬件加速'),
      value: this.check,
      onChanged: (bool value) {
        setState(() {
          this.check = !this.check;
        });
      },
    );
  }

  Widget _dropdownButton() {
    return new DropdownButton(
      value: _dropdownButtonValue,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          value: 0,
          child: new Text('香蕉'),
        ),
        DropdownMenuItem(
          value: 1,
          child: new Text('苹果'),
        ),
        DropdownMenuItem(
          value: 2,
          child: new Text('猕猴桃'),
        ),
        DropdownMenuItem(
          value: 3,
          child: new Text('橘子'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          this._dropdownButtonValue = value;
        });
      },
    );
  }

  Widget _flatButton() {
    return FlatButton(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.green,
      disabledTextColor: Colors.red,
      splashColor: Colors.orange, // 波纹颜色
      highlightColor: Colors.blueAccent, // 按下的背景颜色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
            color: Color(0xFF6FFF00), style: BorderStyle.solid, width: 2),
      ),
      onPressed: () {
        // 没有定义的时候 显示disabled的颜色
        print('onPressed\n'); //点击后 手指弹起的时候调用
      },
      child: Text('Flat Button'),
    );
  }

  Widget _flatIconButton() {
    return FlatButton.icon(
      icon: Icon(Icons.star),
      label: Text('hello'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
            color: Color(0xFF6FFF00), style: BorderStyle.solid, width: 2),
      ),
      onPressed: () {
        print('onPressed\n');
      },
    );
  }

  Widget _raisedButton() {
    return RaisedButton(
      onPressed: () {
        print('点击浮动按钮');
      },
      child: Text("RaisedButton"),
      color: Colors.red,
      textColor: Colors.white,
      elevation: 30,
      shape: StadiumBorder(), //半圆
    );
  }

  Widget _raisedCircleButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text("o"),
      color: Colors.blue,
      textColor: Colors.white,
      shape: CircleBorder(
        side: BorderSide(color: Colors.red, width: 3),
      ),
    );
  }

  Widget _iconButton() {
    return IconButton(
      iconSize: 34,
      icon: Icon(Icons.star),
      onPressed: () {},
      color: Colors.blue,
    );
  }

  Widget _radioGroup() {
    return Row(
      children: <Widget>[
        Row(children: <Widget>[
          Text('A'),
          _radio(4),
        ]),
        Row(children: <Widget>[
          Text('B'),
          _radio(5),
        ]),
        Row(children: <Widget>[
          Text('C'),
          _radio(6),
        ])
      ],
    );
  }

  Widget _radio(index) {
    return Radio(
      value: index,
      groupValue: _radioValue,
      onChanged: (value) {
        setState(() {
          this._radioValue = value;
        });
      },
    );
  }

  Widget _radioListTileColumn() {
    return Column(children: <Widget>[
      _radioListTile('A', 0),
      _radioListTile('B', 1),
      _radioListTile('c', 2),
    ]);
  }

  Widget _radioListTile(text, value) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: _radioValue,
      onChanged: (value) {
        setState(() {
          this._radioValue = value;
        });
      },
    );
  }

  Widget _slide() {
    return Slider(
      label: '$_slideValue',
      divisions: 10, //分段个数
      activeColor: Colors.green,
      inactiveColor: Colors.greenAccent,
      value: _slideValue,
      onChanged: (value) {
        setState(() {
          this._slideValue = value;
        });
      },
    );
  }

  Widget _slideAdaptive() {
    return Slider.adaptive(
      value: _slideValue,
      onChanged: (value) {
        setState(() {
          this._slideValue = value;
        });
      },
    );
  }

  Widget _switch() {
    return Switch(
      activeColor: Colors.green,
      activeTrackColor: Colors.cyanAccent, //设置条状的颜色
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          this._switchValue = value;
        });
      },
    );
  }

  Widget _switchAdaptive() {
    return Switch.adaptive(
      activeColor: Colors.blue,
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          this._switchValue = value;
        });
      },
    );
  }
}
