class UserFirebaseModel {
  String? id;
  String name;
  String email;
  UserFirebaseModel({this.id, required this.name, required this.email});
  factory UserFirebaseModel.fromJson(String id, Map<String, dynamic> json) {
    return UserFirebaseModel(id: id, name: json['name'], email: json['email']);
  }
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
