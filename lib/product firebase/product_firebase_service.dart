import 'package:broadway_example_ui/product%20firebase/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFirebaseService {
  final productCollection = FirebaseFirestore.instance.collection("product");
  Future<void> addProduct(ProductModel data) async {
    try {
      await productCollection.add(data.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final data = await productCollection.get();
      return data.docs
          .map((e) => ProductModel.fromJson(e.id, e.data()))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
