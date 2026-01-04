import 'package:broadway_example_ui/login%20with%20bloc/login_event.dart';
import 'package:broadway_example_ui/login%20with%20bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginData>((event, emit) async {
      emit(LoginLoading());

      await Future.delayed(Duration(seconds: 2));
      if (event.email == "admin@gmail.com" && event.password == "1234") {
        emit(LoginSuccess());
      } else {
        emit(LoginError("Invalid credentials, Please try again"));
      }
    });
    on<Logout>((event, emit) {
      emit(LoginLoading());
    });
  }
}
