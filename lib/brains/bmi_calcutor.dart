import 'dart:math';

class BmiCalcutor {
  double bmi = 0.0;
  String bmiCalculator(double weight, double height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getResponse() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have normal weight. Good job';
    } else {
      return 'You have lower then normal body weight. Exercise more';
    }
  }
}
