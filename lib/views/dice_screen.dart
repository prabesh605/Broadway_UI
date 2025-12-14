import 'package:flutter/material.dart';
import 'dart:math';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDice = 1;
  int rightDice = 2;

  void changeDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: Text("Dice Game"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text(
            "Click on the Dice to shuffle",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  changeDice();
                },
                child: Image.asset('assets/dice$leftDice.png', height: 80),
              ),
              ElevatedButton(
                onPressed: () {
                  changeDice();
                },
                child: Image.asset('assets/dice$rightDice.png', height: 80),
              ),
            ],
          ),
          SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {
              changeDice();
            },
            child: Text("Shuffle"),
          ),
          Spacer(),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go back to home screen",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
