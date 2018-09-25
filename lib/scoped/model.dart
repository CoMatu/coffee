import 'package:coffee/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  List<Product> _orderList = List();
  List<Product> get orderList => _orderList;

  int _counter = 0;
  int get counter => _counter;

}

abstract class IncrementProduct extends ProductModel {
  void increment(){
    _counter++;
    notifyListeners();
  }
}

abstract class DecrementProduct extends ProductModel {
  void decrement(){
    if(_counter > 0)
    _counter--;
    notifyListeners();
  }
}

class MainModel extends Model with ProductModel,
    IncrementProduct, DecrementProduct{}

/*
abstract class AddProduct extends ProductModel{
  Product product;
  AddProduct(this.product);
  void addProduct() {
    _orderList.add(product);
    notifyListeners();
  }
}

abstract class RemoveLastProduct extends ProductModel{
  Product product;
  RemoveLastProduct(this.product);
  void addProduct() {
    _orderList.removeLast();
    notifyListeners();
  }
}

abstract class ResetProduct extends ProductModel{
  Product product;
  ResetProduct(this.product);
  void addProduct() {
    _orderList.clear();
    notifyListeners();
  }
}*/
