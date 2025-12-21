import 'package:broadway_example_ui/avatars/avatar_screen.dart';
import 'package:broadway_example_ui/expenses_tracker.dart';
import 'package:broadway_example_ui/mobile/mobile_screen.dart';
import 'package:broadway_example_ui/users/user_screen.dart';
import 'package:broadway_example_ui/views/bmi_calculator_screen.dart';
import 'package:broadway_example_ui/weather/weather_screen.dart';
import 'package:flutter/material.dart';

// String validate(int age) {
//   if (age < 18) {
//     return "Underage";
//   }
//   return "Allowed";
// }

// bool isEven(int number) {
//   return number % 2 == 0;
// }

// double priceWithTax(double price) {
//   return price + (price * 0.13);
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EmailField());
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("$count"),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TextField(key: Key("email")));
  }
}
