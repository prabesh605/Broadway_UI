import 'package:broadway_example_ui/next_screen.dart';
import 'package:broadway_example_ui/provider/counter_provider.dart';
import 'package:broadway_example_ui/provider/task_screen.dart';
import 'package:broadway_example_ui/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreenWithProvider extends StatefulWidget {
  const CounterScreenWithProvider({super.key});

  @override
  State<CounterScreenWithProvider> createState() =>
      _CounterScreenWithoutState();
}

class _CounterScreenWithoutState extends State<CounterScreenWithProvider> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen with Provider"),
        actions: [
          Switch(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.changeTheme();
            },
          ),
        ],
      ),
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
                    provider.decrement();
                    // decrement();
                  },
                  icon: Icon(Icons.remove, size: 30),
                ),
              ),
              SizedBox(width: 10),
              Text("${provider.count}", style: TextStyle(fontSize: 26)),
              SizedBox(width: 10),
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    provider.increment();
                    // increment();
                  },
                  icon: Icon(Icons.add, size: 30),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              provider.reset();
            },
            child: Text("Reset"),
          ),
          SizedBox(height: 100),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreenWithProvider(),
                ),
              );
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}
