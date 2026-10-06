import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // return runApp(MaterialApp(home: MyApp()));
  return runApp(CupertinoApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Hello Flutter!')));
  }
}
