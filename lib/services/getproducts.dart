import 'dart:async';
import 'package:coffee/models/product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:coffee/models/serializers.dart';

class GetProductsList {
  Future<List<List<Product>>> productsList() async {
    int childNumber;
    // считываем размер списка секций
    var count =
    await FirebaseDatabase.instance.reference().child('sections').once();

    Map data = count.value;
    childNumber = data.length;
    print('количество детей в этой базе: ' + childNumber.toString());
    List<List<Product>> list = List();
    //формируем списки продуктов для каждой секции
    for (int i = 0; i < data.length; i++) {
      int numb = i + 1;
      String path = 'section_$numb';
      var snapshot = await FirebaseDatabase.instance
          .reference()
          .child('sections')
          .child(path)
          .once();

      List<Product> productsList = List();
      List snapList = List();

      for (var value in snapshot.value) {
        snapList.add(value);
      }
      for (int i = 0; i < snapList.length; i++) {
        Map<String, dynamic> data = Map.from(snapList[i] as Map);
        Product product = serializers.deserializeWith(Product.serializer, data);
        productsList.add(product);
      }
      list.add(productsList);
    }
    // возвращает список списков продуктов (по списку на секцию)
    return list;
  }

}