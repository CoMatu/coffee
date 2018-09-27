import 'package:coffee/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  List<Product> _orderList = [];
  List<Product> get orderList => _orderList;

  int getProductCount(Product product){
    List<Product> proList = [];
    for(int i = 0; i < _orderList.length; i++){
      if(_orderList[i].id == product.id){
        proList.add(_orderList[i]);
      }
    }
    return proList.length;
  }

  double getOrderCost(){
    double orderCost = 0.00;
    for(int i = 0; i < _orderList.length; i++){
      //TODO расчет
    }
  }

}

abstract class AddProduct extends ProductModel {
  void addProduct(Product product){
    _orderList.add(product);
    notifyListeners();
  }
}

abstract class RemoveProduct extends ProductModel {
  void removeProduct(Product product){
    if(_orderList.length > 0)
      _orderList.remove(product);
      //remove product
    notifyListeners();
  }
}

class MainModel extends Model with ProductModel,
    AddProduct, RemoveProduct{}