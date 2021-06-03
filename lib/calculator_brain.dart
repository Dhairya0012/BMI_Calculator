import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;

  late double _bmi = double.parse(calculateBMI());

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    // double _bmi = double.parse(calculateBMI());
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    // double _bmi = double.parse(calculateBMI());
    if (_bmi >= 25) {
      return 'You have a higher than normal body  weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }

  // Function getResult = ()=>     _bmi>=25 ? 'Overweight' : _bmi >18.5 ? 'Normal' : 'Underweight';

}
