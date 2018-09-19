import 'dart:async';
import 'dart:io';

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
      name: 'hr-metrics',
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
    FirebaseDatabase database;
    database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('fffffff');
  }

  void navigationPage() {
    //TODO сделать переход на другой экран
  }
}