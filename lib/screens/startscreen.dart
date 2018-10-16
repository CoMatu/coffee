import 'dart:async';
import 'dart:io';

import 'package:coffee/models/product.dart';
import 'package:coffee/screens/home.dart';
import 'package:coffee/sections.dart';
import 'package:coffee/services/getproducts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//const Color _brawn = Color(0xFF795548);
const Color _brawn = Colors.red;
const Color _brawnLi = Color(0xFFFFCC80);
const Color _grey = Color(0xFFE0E0E0);
const Color _mySin = Color(0xFFA1887F);
const Color _amber = Color(0xFFFFF8E1);

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  String textValue = '';

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

    var _duration = Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    var android = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var platform = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg)}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        showNotification(msg);
        print(" onMessage called ${(msg)}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      update(token);
    });
    startTime();
  }

  showNotification(Map<String, dynamic> msg) async {
    var android = AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "This is title", "this is demo", platform);
  }

  update(String token) {
    print(token);
    DatabaseReference databaseReference = FirebaseDatabase().reference();
    databaseReference.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100.0,),
      ),
    );
/*
    return FutureBuilder(
        future: _productsList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
//    Navigator.of(context).pushReplacementNamed('/home');
          return Scaffold(
              body: Center(
            child: FlutterLogo(
              size: 100.0,
            ),
          ));
        });
*/
  }

  Future navigationPage() async {
/*
//TODO пока отключил офлайн режим, так как почему-то не отслеживает изменения в онлайне
    FirebaseDatabase database;
    database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(5000000);
*/

    List<List<Product>> sectionDataList =
        await GetProductsList().productsList();

    List<Section> allSections = <Section>[
      Section(
        title: 'НАТУРАЛЬНЫЙ КОФЕ',
        leftColor: _brawn,
        rightColor: _mySin,
        details: sectionDataList[0],
      ),
      Section(
        title: 'КОФЕЙНЫЕ НАПИТКИ',
        leftColor: _brawn,
        rightColor: _brawnLi,
        details: sectionDataList[1],
      ),
      Section(
          title: 'МОЛОЧНЫЕ КОКТЕЙЛИ',
          leftColor: _brawn,
          rightColor: _amber,
          details: sectionDataList[2]),
      Section(
          title: 'ЧАЙ, ФРЭШ, ТОППИНГИ',
          leftColor: _brawn,
          rightColor: _grey,
          details: sectionDataList[3]),
    ];

    //TODO сделать переход на другой экран
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AnimationHome(allSections)));
  }
}
