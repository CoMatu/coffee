import 'package:coffee/models/product.dart';

class AddProductAction{
final Product product;

AddProductAction(this.product);
}

class RemoveProductAction{
final Product product;

RemoveProductAction(this.product);
}