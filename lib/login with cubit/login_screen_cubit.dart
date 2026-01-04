import 'package:broadway_example_ui/login%20with%20cubit/login_cubit.dart';
import 'package:broadway_example_ui/login%20with%20cubit/login_state.dart';
import 'package:broadway_example_ui/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenCubit extends StatefulWidget {
  const LoginScreenCubit({super.key});

  @override
  State<LoginScreenCubit> createState() => _LoginScreenCubitState();
}

class _LoginScreenCubitState extends State<LoginScreenCubit> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: paswordController,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = paswordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  context.read<LoginCubit>().login(email, password);
                }
              },
              child: Text('Login'),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is LoginSuccess) {
                  return Center(child: Text("Success"));
                }
                if (state is LoginError) {
                  return Center(child: Text(state.message));
                }
                if (state is LoginNetwork) {
                  return Center(child: Text("Network Error"));
                }

                return Container(child: Text("Empty"));
              },
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme();
              },
              icon: Icon(Icons.select_all),
            ),
          ],
        ),
      ),
    );
  }
}
