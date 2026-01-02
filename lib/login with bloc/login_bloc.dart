import 'package:broadway_example_ui/login%20with%20bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void login(String email, String password) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));
    if (email == "admin@gmail.com" && password == "1234") {
      emit(LoginSuccess());
    } else {
      emit(LoginError("Invalid credentials"));

      // print("Invalid credentials");
    }
  }
}
