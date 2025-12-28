import 'package:broadway_example_ui/next_screen.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  double value = 0;
  @override
  void initState() {
    final controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    controller.forward();
    animation = Tween<double>(begin: 0.0, end: 100.0).animate(controller);
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    // controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {
        value = controller.value * 100;
      });
      print(animation.value);
    });
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   } else if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   }

    //   // AnimationStatus.dismissed
    //   // AnimationStatus.completed
    //   print(status);
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(animation.value),
      appBar: AppBar(title: Text("Animation")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     SizedBox(width: value),
            //     Text(
            //       "Percent :${value.toStringAsFixed(0)}%",
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  height: animation.value,
                  width: animation.value,
                  child: child,
                );
              },
              child: Image.asset("assets/flower.png"),
            ),
            // SizedBox(height: value),
            // Hero(
            //   tag: "flower",
            //   child: Image.asset(
            //     "assets/flower.png",
            //     height: controller?.value ?? 1 * 100,
            //   ),
            // ),
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