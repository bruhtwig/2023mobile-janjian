import 'package:flutter/material.dart';

class UserProfileField extends StatelessWidget {
  const UserProfileField({super.key, required this.controller, required this.isEnable, required this.title});

  final String title;
  final TextEditingController controller;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: !isEnable ? Border.all(color: Colors.black45) : null,
            color: isEnable ? Colors.white : Colors.white10,
          ),
          child: TextField(
            enabled: isEnable,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 16,
                color: const Color(0xff000000).withOpacity(0.6),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }
}
