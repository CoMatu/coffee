import 'package:coffee/models/product.dart';
import 'package:coffee/redux/actions.dart';

List<Product> productReducer(List<Product> products, dynamic action){
  if(action is AddProductAction){
    return addProduct(products, action);
  } else if(action is RemoveProductAction){
    return removeProduct(products, action);
  }
  return products;
}

List<Product> removeProduct(List<Product> products, RemoveProductAction action) {
  return List.from(products)..removeLast();
}

List<Product> addProduct(List<Product> products, AddProductAction action) {
  return List.from(products)..add(action.product);
}