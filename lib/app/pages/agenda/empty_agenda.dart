import 'package:flutter/material.dart';

class EmptyAgenda extends StatelessWidget {
  const EmptyAgenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Image.asset('assets/images/empty_agenda.png'),
              const Text(
                'Oops undangan kamu kosong . . .',
                style: TextStyle(
                  color: Color(0xaf696969),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
