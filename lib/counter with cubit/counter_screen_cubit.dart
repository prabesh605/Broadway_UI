import 'package:broadway_example_ui/counter%20with%20cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenCubit extends StatefulWidget {
  const CounterScreenCubit({super.key});

  @override
  State<CounterScreenCubit> createState() => _CounterScreenBlocState();
}

class _CounterScreenBlocState extends State<CounterScreenCubit> {
  // int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                      // setState(() {
                      //   count--;
                      // });
                    },
                    child: Text("Remove"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("$state"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                      // setState(() {
                      //   count++;
                      // });
                    },
                    child: Text("Add"),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => HomeScreen()),
                  //     );
                  //   },
                  //   child: Text("Next"),
                  // ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
