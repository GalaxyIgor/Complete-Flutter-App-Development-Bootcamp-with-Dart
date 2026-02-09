import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const ButtonIcon({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
