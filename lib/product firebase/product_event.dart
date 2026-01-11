import 'package:broadway_example_ui/product%20firebase/product_model.dart';

abstract class ProductEvent {}

class GetProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final ProductModel data;
  AddProduct(this.data);
}

class DeleteProduct extends ProductEvent {
  String id;
  DeleteProduct(this.id);
}

class UpdateProduct extends ProductEvent {
  final ProductModel data;
  UpdateProduct(this.data);
}

class LoadProducts extends ProductEvent {}

class StreamProducts extends ProductEvent {
  final List<ProductModel> products; 
  StreamProducts(this.products);
}