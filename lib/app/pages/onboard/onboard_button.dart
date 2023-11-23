import 'package:flutter/material.dart';

class OnboardButton extends StatelessWidget {
  final String buttonText;
  final Function buttonPressed;
  final Color buttonColor;
  final Color textColor;

  const OnboardButton(
      {super.key,
        required this.buttonText,
        required this.buttonPressed,
        required this.buttonColor,
        required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 41,
      child: ElevatedButton(
        onPressed: () => buttonPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}