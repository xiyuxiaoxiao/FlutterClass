import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldClass extends StatefulWidget {
  final title;
  TextFieldClass({Key key, @required this.title}) : super(key: key);

  _TextFieldClassState createState() => _TextFieldClassState(title: title);
}

class _TextFieldClassState extends State<TextFieldClass> {
  final title;

  // 构造函数
  _TextFieldClassState({
    Key key,
    this.title,
  }) : super();

  final TextEditingController _controller = new TextEditingController();
  var fieldText = '';

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.addListener(() {
      String text = _controller.text.toLowerCase();
      this.setState(() {
        fieldText = text.toString();
      });
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${title}'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return new Container(
      padding: EdgeInsets.all(40),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              MaterialButton(
                child: new Text('撤销键盘数字键盘下'),
                onPressed: () {
                  _focusNode.unfocus();
                },
              ),
              MaterialButton(
                child: new Text('下一个响应'),
                onPressed: () {
                  _focusNode.nextFocus();
                },
              ),
            ],
          ),
          new Text("${fieldText}"),
          new Container(height: 20),
          new TextField(
            controller: _controller, // controller 监听
            decoration: new InputDecoration(
              hintText: "controller 监听",
            ),
          ),
          new Container(height: 20),
          new TextField(
            focusNode: _focusNode,
            autofocus: true, // 自动获取焦点
            decoration: new InputDecoration(
              hintText: "请输入 数字类型", // 默认提示
              contentPadding: EdgeInsets.all(10), // 设置内边距,
              border: OutlineInputBorder(
                // 设置边框圆角度
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (String text) {
              //监听变化
              print('change $text');
              this.setState(() {
                fieldText = text;
              });
            },
            onSubmitted: (String text) {
              //点击完成的时候
              print('sub $text');
            },
          ),
          new Container(height: 20),
          new TextField(
            decoration: new InputDecoration(
              hintText: "密码类型", // 默认提示
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            obscureText: true, // 密码类型
          ),
        ],
      ),
    );
  }
}
