import 'package:coffee/models/product.dart';
import 'package:coffee/scoped/model.dart';
import 'package:coffee/screens/startscreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: StartScreen(),
      )
    );
/*
*/
  }
}