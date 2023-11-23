import 'package:flutter/material.dart';

class EmptySpareTime extends StatelessWidget {
  const EmptySpareTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Image.asset('assets/images/empty_spare_time.png'),
              const Text(
                'Kamu belum isi waktu luang nih',
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
