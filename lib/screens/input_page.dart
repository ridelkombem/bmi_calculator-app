import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'result_page.dart';

enum Gender { male, female, unselected }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.unselected;

  int height = 180;
  int age = 20;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0xFFFFFFFF),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x1fEB1555),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 30,
                          )),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ]),
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'yrs',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ]),
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              bottomLabel: 'CALCULATE',
              onTap: () {
                CalcBrain calc =
                    CalcBrain(age: age, weight: weight, height: height);
                calc.getBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ResultPage(
                      resultText: calc.getBMIResult(),
                      bmiSum: calc.getBMI(),
                      resultInterpretation: calc.getBMIInterpretation(),
                    );
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
