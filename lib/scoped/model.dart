import 'package:coffee/models/product.dart';
import 'package:coffee/models/order_position.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  // Общий список заказа
  List<Product> _orderList = [];

  List<Product> get orderList => _orderList;

  // Список позиций заказа для показа в корзине
  Map<int, OrderPosition> _positionList = Map();

  Map<int, OrderPosition> get positionList => _positionList;

  // Количество выбранных продуктов для показа в карточке
  int getProductCount(Product product) {
    List<Product> proList = [];
    for (int i = 0; i < _orderList.length; i++) {
      if (_orderList[i].id == product.id) {
        proList.add(_orderList[i]);
      }
    }
    return proList.length;
  }

  // Стоимость заказа для показа на FAB
  double getOrderCost() {
    double orderCost = 0.00;
    for (int i = 0; i < _orderList.length; i++) {
      orderCost = orderCost + _orderList[i].price;
    }
    return orderCost;
  }
}

// Добавляем продукты в общий список (на карточке продукта)
abstract class AddProduct extends ProductModel {
  void addProduct(Product product) {
    _orderList.add(product);
    addPosition(product);

    notifyListeners();
  }

  void addPosition(Product product) {
    var uniqueProducts = _orderList.toSet().toList();
    for(int i = 0; i < uniqueProducts.length; i++){
      var value = OrderPosition(
          uniqueProducts[i].title,
          getCount(uniqueProducts[i].id));
      _positionList[uniqueProducts[i].id] = value;
    }
//    print(uniqueProducts.length.toString());
  }

  int getCount(int id) {
    int count = 0;
    for(int i = 0; i < _orderList.length; i++){
      if(_orderList[i].id == id)
        count ++;
    }
    return count;
  }
}

// Убираем продукты из общего списка (на карточке продукта)
abstract class RemoveProduct extends ProductModel {
  void removeProduct(Product product) {
    if (_orderList.length > 0) {
      _orderList.remove(product);
      removePosition(product);
    }
    notifyListeners();
  }

  void removePosition(Product product) {
    int counter = getProductCount(product);
    if(counter == 0){
      _positionList.remove(product.id);
    } else {
      var value = OrderPosition(
          product.title,
          counter);
      _positionList[product.id] = value;
    }
  }
}

class MainModel extends Model with ProductModel, AddProduct, RemoveProduct {}
