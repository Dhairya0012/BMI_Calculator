import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPressed: () {},
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kInactiveTrackColor,
                        activeTrackColor: kActiveTrackColor,
                        thumbColor: kThumbColor,
                        overlayColor: kOverlayColor,
                        thumbShape: kThumbShape,
                        overlayShape: kOverlayShape,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              //Row
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {},
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                icon: Icons.add,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {},
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                icon: Icons.add,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onPressed, required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        )),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
