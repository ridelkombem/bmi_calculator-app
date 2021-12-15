import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiSum;
  final String resultText;
  final String resultInterpretation;
  const ResultPage(
      {Key? key,
      required this.bmiSum,
      required this.resultText,
      required this.resultInterpretation})
      : super(key: key);

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
            const Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultText,
                        style: kResultTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmiSum,
                        style: kBMITextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        resultInterpretation,
                        style: kBMIResultTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                onPress: () {},
              ),
            ),
            BottomButton(
                bottomLabel: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
