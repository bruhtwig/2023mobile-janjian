import 'package:flutter/material.dart';

class AgendaFormField extends StatelessWidget {
  const AgendaFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText});

  final TextEditingController controller;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        Container(
          height: 30,
          margin: const EdgeInsets.only(bottom: 20),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              border: const UnderlineInputBorder(),
              contentPadding: const EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
      ],
    );
  }
}
