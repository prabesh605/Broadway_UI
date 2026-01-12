import 'package:broadway_example_ui/product%20firebase/product_model.dart';
import 'package:broadway_example_ui/product%20firebase/user_model_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class ProductFirebaseService {
  final productCollection = FirebaseFirestore.instance.collection("product");
  final userCollection = FirebaseFirestore.instance.collection('user');
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

  Future<void> deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateProduct(ProductModel data) async {
    try {
      await productCollection.doc(data.id).update(data.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<List<ProductModel>> getProductStream() {
    try {
      return productCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProductModel.fromJson(doc.id, doc.data());
        }).toList();
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user?.uid ?? "";
      // print(response);
    } catch (e) {
      return '';
      // throw Exception(e.toString());
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(response);
      return response.user?.uid ?? "";
      // print(response);
    } catch (e) {
      return '';
      // throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    final response = await FirebaseAuth.instance.signOut();
  }

  Future<String> currentUser() async {
    try {
      final response = await FirebaseAuth.instance.currentUser;
      return response?.uid ?? "";
    } catch (e) {
      return '';
    }
  }

  Future<void> saveUser(UserModelFirebase user) async {
    try {
      final response = await userCollection.add(user.toJson());
      print(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
