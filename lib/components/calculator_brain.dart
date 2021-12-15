import 'dart:math';

class CalcBrain {
  int age;
  int weight;
  int height;
  late double _bmi;

  CalcBrain({
    required this.age,
    required this.weight,
    required this.height,
  });
  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getBMIInterpretation() {
    if (_bmi >= 25) {
      return 'Exercise more!';
    } else if (_bmi > 18.5) {
      return 'Keep healthy!';
    } else {
      return 'Eat more!';
    }
  }
}
