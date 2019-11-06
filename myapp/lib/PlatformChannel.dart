import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wyj_test_plugin/wyj_test_plugin.dart';

class PlatformChannel extends StatefulWidget {
  String title;

  PlatformChannel({Key key, this.title}) : super(key: key);

  PlatformChannelState createState() => new PlatformChannelState();
}

class PlatformChannelState extends State<PlatformChannel> {

  // 构建通道 
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'unknown';
  String _calculateDifferenceSquares = 'unknown';

  int number1 = 5;


  _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result %.';
    } catch (e) {
      batteryLevel = "error '${e.meeeage}";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  _getCalculateDifferenceSquares() async {
    number1 += 1;
    String differenceSquares;
    try {
      final String result = await WyjTestPlugin.calculateDifferenceSquares(number1, 3);
      differenceSquares = '($number1-3)*($number1+3) = $result';
    }catch (e) {
      differenceSquares = "error '${e.meeeage}";
    }
    setState(() {
      _calculateDifferenceSquares = differenceSquares;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Material(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(
                child: new Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              new Text(_batteryLevel),

              new RaisedButton(
                child: new Text('引用自定义插件 计算两数'),
                onPressed: _getCalculateDifferenceSquares,
              ),
              new Text(_calculateDifferenceSquares),
            ],
          ),
        ),
      ),
    );
  }
}
