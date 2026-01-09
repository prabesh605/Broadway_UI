// import 'dart:async';
// import 'dart:developer';

import 'package:broadway_example_ui/product%20firebase/product_event.dart';
import 'package:broadway_example_ui/product%20firebase/product_firebase_service.dart';
// import 'package:broadway_example_ui/product%20firebase/product_model.dart';
import 'package:broadway_example_ui/product%20firebase/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductFirebaseService service;
  // StreamSubscription<List<ProductModel>>? subscription;
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
    on<DeleteProduct>((event, emit) async {
      emit(ProductLoading());
      await service.deleteProduct(event.id);
      final data = await service.getProducts();
      emit(ProductLoaded(data));
    });
    on<UpdateProduct>((event, emit) async {
      emit(ProductLoading());
      await service.updateProduct(event.data);
      final data = await service.getProducts();
      emit(ProductLoaded(data));
    });
    // on<StreamProducts>((event, emit) async {
    //   // emit(ProductLoading());
    //   // final data = service.getProductStream();
    //   // emit(ProductLoadedStream(data));
    //   subscription?.cancel();
    //   subscription = service.getProductStream().listen(
    //     (product) {
    //       emit(ProductLoaded(product));
    //     },
    //     onError: (error) {
    //       emit(ProductError(error.toString()));
    //     },
    //     onDone: () {},
    //   );
    // });
  }
  // @override
  // Future<void> close() {
  //   subscription?.cancel();
  //   return super.close();
  // }
}
