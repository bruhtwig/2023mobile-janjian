import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.buttonPressed});

  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 41,
      child: ElevatedButton(
        onPressed: () => buttonPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff78BBE6),
        ),
        child: const Text(
          'Masuk',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
