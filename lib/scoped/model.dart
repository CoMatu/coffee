import 'package:coffee/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  // Общий список заказа
  List<Product> _orderList = [];
  List<Product> get orderList => _orderList;

  // Список заказа для корзины (название и количество)
  Map<String, int> _cartList = Map();
  Map<String, int> get cartList => _cartList;

  // Количество выбранных продуктов для показа в карточке
  int getProductCount(Product product){
    List<Product> proList = [];
    for(int i = 0; i < _orderList.length; i++){
      if(_orderList[i].id == product.id){
        proList.add(_orderList[i]);
      }
    }
    return proList.length;
  }

  // Стоимость заказа для показа на FAB
  double getOrderCost(){
    double orderCost = 0.00;
    for(int i = 0; i < _orderList.length; i++){
      //TODO расчет
      orderCost = orderCost + _orderList[i].price;
    }
    return orderCost;
  }

  // Формируем список уник продуктов для списка в корзине


}

// Добавляем продукты в общий список (на карточке продукта)
abstract class AddProduct extends ProductModel {
  void addProduct(Product product){
    _orderList.add(product);

    // добавляем в карту название-количество если они отсутствуют
    _cartList.putIfAbsent(product.title, ()=> getProductCount(product));

    notifyListeners();
  }
}

// Убираем продукты из общего списка (на карточке продукта)
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