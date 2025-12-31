import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 1;

  void increment() {
    if (count < 10) {
      count++;
    }

    notifyListeners();
  }

  void decrement() {
    if (count > 1) {
      count--;
    }

    notifyListeners();
  }

  void reset() {
    count = 1;
    notifyListeners();
  }
}
