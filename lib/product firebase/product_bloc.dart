import 'package:broadway_example_ui/product%20firebase/product_event.dart';
import 'package:broadway_example_ui/product%20firebase/product_firebase_service.dart';
import 'package:broadway_example_ui/product%20firebase/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductFirebaseService service;
  ProductBloc(this.service) : super(ProductInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductLoading());
      final data = await service.getProducts();
      emit(ProductLoaded(data));
    });
    on<AddProduct>((event, emit) async {
      emit(ProductLoading());
      await service.addProduct(event.data);
      final data = await service.getProducts();
      emit(ProductLoaded(data));
    });
  }
}
