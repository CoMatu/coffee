import 'dart:async';
import 'package:coffee/models/product.dart';
import 'package:firebase_database/firebase_database.dart';

class GetProductsList {

  Future<List<Product>> productsList() async{
    String path = 'section_1';
    FirebaseDatabase database;
    var snapshot = database.reference().child('sections').child(path).once();
    List<Product> list = List();
    List snapList = List();

    return list;
  }
}