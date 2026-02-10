
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  
  const BottomButton({
    required this.onTap,
    required this.buttonTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kcustomButtonColor,
        width: double.infinity,
        height: kcustomButtonHeight,
        child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle
        ),
      ),
    );
  }
}
