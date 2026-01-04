abstract class LoginEvent {}

class LoginData extends LoginEvent {
  String email;
  String password;
  LoginData(this.email, this.password);
}

class Logout extends LoginEvent {}
