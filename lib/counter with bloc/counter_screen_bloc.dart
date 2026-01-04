import 'package:broadway_example_ui/counter%20with%20bloc/counter_bloc.dart';
import 'package:broadway_example_ui/counter%20with%20bloc/counter_event.dart';
import 'package:broadway_example_ui/counter%20with%20bloc/counter_state.dart';
import 'package:broadway_example_ui/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenBloc extends StatefulWidget {
  const CounterScreenBloc({super.key});

  @override
  State<CounterScreenBloc> createState() => _CounterScreenBlocState();
}

class _CounterScreenBlocState extends State<CounterScreenBloc> {
  // int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Decrement());
                    },
                    child: Text("Remove"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("${state.value}"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Increament());
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
