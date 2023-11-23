import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthFormField extends StatelessWidget {
  AuthFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      this.icon,
      this.isPassword = false}) {
    isPassword ? isObscure = true.obs : isObscure = false.obs;
  }

  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  late final RxBool isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(width: 1),
          ),
          child: Obx(() {
            return TextField(
              controller: controller,
              obscureText: isObscure.value,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () => isObscure(!isObscure.value),
                        icon: Icon(
                          isObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      )
                    : Icon(
                        icon,
                        color: Colors.grey,
                      ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
