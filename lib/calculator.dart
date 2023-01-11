import 'dart:math';

class Calculator {
  int? height;
  int? weight;
  double? _bmi;

  Calculator(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal bodyweight. Try to excercise more!! ';
    } else if (_bmi! > 18.5) {
      return 'You have a normal bodyweight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You should eat more!!';
    }
  }
}
