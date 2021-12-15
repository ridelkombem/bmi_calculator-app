import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String bottomLabel;
  final VoidCallback onTap;
  const BottomButton({Key? key, required this.bottomLabel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 15),
        height: 80,
        width: double.infinity,
        color: const Color(0xFFEB1555),
        child: Text(
          bottomLabel,
          style: kLargeButtonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
