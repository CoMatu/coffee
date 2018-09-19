import 'dart:async';
import 'dart:io';

import 'package:coffee/models/product.dart';
import 'package:coffee/services/getproducts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class StartScreen extends StatefulWidget{
  @override
  StartScreenState createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {

  startTime() async {
    await FirebaseApp.configure(
      name: 'Coffee App',
      options: Platform.isIOS
          ? const FirebaseOptions(
          googleAppID: 'xxxxxxx',
          gcmSenderID: 'xxxxxxx',
          databaseURL: 'https://coffee-aebae.firebaseio.com/')
          : const FirebaseOptions(
          apiKey: 'AIzaSyBEYrlQjhJ0mPCF01b6e7Umt09Fvki8XD8',
          databaseURL: 'https://coffee-aebae.firebaseio.com/',
          googleAppID: '1:473029291676:android:1995995ec3fc285b'),
    );

    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: productsList(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
        return Text(snapshot.toString());
        }
    );
  }

  void navigationPage() {

    FirebaseDatabase database;
    database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(5000000);

    var listtttt = productsList();



    //TODO сделать переход на другой экран
//    Navigator.of(context).pushReplacementNamed('/home');
  }
  Future<List<Product>> productsList() async{
    String path = 'section_1';
    FirebaseDatabase database = FirebaseDatabase();
    var snapshot = await FirebaseDatabase.instance.reference().child('sections').child(path).once();
    List<Product> list = List();
    List snapList = List();

    for (var value in snapshot.value) {
      snapList.add(value);
    }


    return list;
  }
}