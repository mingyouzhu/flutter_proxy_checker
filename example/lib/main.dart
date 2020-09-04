import 'package:flutter/material.dart';
import 'package:flutter_proxy_checker/flutter_proxy_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isEnbaledProxy = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('isEnabledProxy: $isEnbaledProxy'),
              RaisedButton(
                child: Text(
                  'Button',
                ),
                color: Colors.blue,
                onPressed: () async {
                  isEnbaledProxy = await FlutterProxyChecker.isEnabledProxy();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
