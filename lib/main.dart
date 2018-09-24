import 'package:coffee/models/product.dart';
import 'package:coffee/screens/startscreen.dart';
import 'package:flutter/material.dart';

List<Product> orderList = List();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: StartScreen(),
    );
  }
}