import 'package:flutter/material.dart';
import 'package:coffee/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationDemo()
    );
  }
}

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AnimationHome();
}