import 'package:broadway_example_ui/next_screen.dart';
import 'package:flutter/material.dart';

class CounterScreenWithout extends StatefulWidget {
  const CounterScreenWithout({super.key});

  @override
  State<CounterScreenWithout> createState() => _CounterScreenWithoutState();
}

class _CounterScreenWithoutState extends State<CounterScreenWithout> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    decrement();
                  },
                  icon: Icon(Icons.remove, size: 30),
                ),
              ),
              SizedBox(width: 10),
              Text("$count", style: TextStyle(fontSize: 26)),
              SizedBox(width: 10),
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    increment();
                  },
                  icon: Icon(Icons.add, size: 30),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimationScreen()),
              );
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}
