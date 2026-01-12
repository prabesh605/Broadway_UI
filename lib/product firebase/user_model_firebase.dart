class UserModelFirebase {
  final String? id;
  final String email;
  final String role;
  UserModelFirebase({
    required this.id,
    required this.email,
    required this.role,
  });
  factory UserModelFirebase.fromJson(String id, Map<String, dynamic> json) {
    return UserModelFirebase(id: id, email: json['email'], role: json['role']);
  }
  Map<String, dynamic> toJson() => {"id": id, "email": email, "role": role};
}
