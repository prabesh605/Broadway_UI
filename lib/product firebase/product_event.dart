import 'package:broadway_example_ui/product%20firebase/product_model.dart';

abstract class ProductEvent {}

class GetProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final ProductModel data;
  AddProduct(this.data);
}
