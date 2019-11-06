import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wyj_test_plugin/wyj_test_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  String _differenceSquares = '0';

  var _numerbParams = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await WyjTestPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }


    String differenceSquares = await WyjTestPlugin.calculateDifferenceSquares(7, 3);

    int numerbParams = await WyjTestPlugin.numberParams(3);

    numerbParams = numerbParams + 1;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _differenceSquares = differenceSquares;
      _numerbParams = numerbParams;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              Text('differenceSquares: $_differenceSquares\n'),
              Text('传递数值: $_numerbParams')
            ],
          ),
        ),
      ),
    );
  }
}
