import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class WyjTestPlugin {
  static const MethodChannel _channel = const MethodChannel('wyj_test_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> calculateDifferenceSquares(int x1, int x2) async {
    var params = {'x1': x1, 'x2': x2};

    var result =
        await _channel.invokeMethod('calculateDifferenceSquares', params);
    return result;
  }

  // Future 表示异步返回的结果 不设置<int>即不校验  因为返回的是一个对象 /*  */
  static Future <int> numberParams(int n) {
    var params = {'number': n};
    Future<int> result = _channel.invokeMethod('numberParams', params);
    return result;
  }


  static Future pluginHomeVC() async {
    await _channel.invokeMethod('pluginHomeVC');
  }
}
