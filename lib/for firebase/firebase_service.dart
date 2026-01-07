import 'package:broadway_example_ui/for%20firebase/user_fireabase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final usersCollection = FirebaseFirestore.instance.collection("users");
  //withoutModel
  Future<void> addUsers(Map<String, dynamic> json) async {
    try {
      await usersCollection.add(json);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //withoutModel
  Future<List<Map<String, dynamic>>> getUsersData() async {
    try {
      final querySnapshot = await usersCollection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addUsersWithModel(UserFirebaseModel data) async {
    try {
      await usersCollection.add(data.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<UserFirebaseModel>> getUsersDataWithModel() async {
    try {
      final querySnapshot = await usersCollection.get();
      return querySnapshot.docs.map((doc) {
        return UserFirebaseModel.fromJson(doc.data());
      }).toList();
      // return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
 // Future<Map<String, dynamic>?> getUsers() async {
  //   try {
  //     QuerySnapshot querySnapshot = await usersCollection.get();

  //     Map<String, dynamic>? data;
  //     for (var doc in querySnapshot.docs) {
  //       data = doc.data() as Map<String, dynamic>;
  //     }
  //     return data;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
