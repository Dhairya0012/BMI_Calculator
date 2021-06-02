import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0E1020),
        scaffoldBackgroundColor: Color(0xFF0E1020),
        textTheme: TextTheme(
            bodyText1: TextStyle(
          color: Colors.white,
        )),
      ),
      home: InputPage(),
    );
  }
}
