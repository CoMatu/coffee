import 'package:coffee/models/product.dart';
import 'package:coffee/models/order_position.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  // Общий список заказа
  List<Product> _orderList = [];

  List<Product> get orderList => _orderList;

  // Список позиций заказа для показа в корзине
  List<OrderPosition> _positionList = [];

  List<OrderPosition> get positionList => getPositions();

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

  // Формируем список уникальных позиций для показа в корзине
  List<OrderPosition> getPositions() {
    for (int i = 0; i < _orderList.length; i++) {
      OrderPosition position = OrderPosition(_orderList[i].id,
          _orderList[i].title, getProductCount(_orderList[i]));

      if (!_positionList.contains(_orderList[i].id)) {
        _positionList.add(position);
      } else {

      }
    }
    return _positionList;
  }
}

// Добавляем продукты в общий список (на карточке продукта)
abstract class AddProduct extends ProductModel {
  void addProduct(Product product) {
    _orderList.add(product);

    notifyListeners();
  }
}

// Убираем продукты из общего списка (на карточке продукта)
abstract class RemoveProduct extends ProductModel {
  void removeProduct(Product product) {
    if (_orderList.length > 0) {
      _orderList.remove(product);
    }
    notifyListeners();
  }
}

class MainModel extends Model with ProductModel, AddProduct, RemoveProduct {}
