import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: onTap,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
