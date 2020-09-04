import 'dart:async';

import 'package:flutter/services.dart';

class FlutterProxyChecker {
  static const MethodChannel _channel =
      const MethodChannel('flutter_proxy_checker');

  static Future<bool> isEnabledProxy() async {
    final Map<dynamic, dynamic> map = await _channel.invokeMethod("isEnabledProxy");
    return map["result"] as bool;
  }
}
