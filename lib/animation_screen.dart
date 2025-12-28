import 'package:broadway_example_ui/next_screen.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),

      body: Column(
        children: [
          Hero(tag: "flower", child: Image.asset("assets/flower.png")),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextScreen()),
              );
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}













// with SingleTickerProviderStateMixin
// late AnimationController controller;
  // @override
  // void initState() {
  //   controller = AnimationController(
  //     duration: Duration(seconds: 1),
  //     vsync: this,
  //   );
  //   controller.addListener(() {
  //     print(controller.value);
  //   });

  //   super.initState();
  // }