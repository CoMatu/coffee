import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder>{
  int get id;
  String get title;
  String get image;
  double get price;
  int get volume;

  static Serializer<Product> get serializer => _$productSerializer;
  Product._();
  factory Product([updates(ProductBuilder b)]) = _$Product;
}