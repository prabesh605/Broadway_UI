import 'package:broadway_example_ui/product%20firebase/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> data;
  ProductLoaded(this.data);
}

class ProductError extends ProductState {
  String message;
  ProductError(this.message);
}
