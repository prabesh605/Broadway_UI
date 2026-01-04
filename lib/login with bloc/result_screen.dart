import 'package:broadway_example_ui/login%20with%20bloc/login_bloc.dart';
import 'package:broadway_example_ui/login%20with%20bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultBLocScreen extends StatefulWidget {
  const ResultBLocScreen({super.key});

  @override
  State<ResultBLocScreen> createState() => _ResultBLocScreenState();
}

class _ResultBLocScreenState extends State<ResultBLocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Success"), backgroundColor: Colors.green),
            );
          }
          if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Column(children: [Text("Result")]),
      ),
    );
  }
}
