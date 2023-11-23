import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  final String pageTitle;
  final String description;
  final String imagePath;

  const OnboardContent(
      {super.key,
      required this.pageTitle,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F6),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              pageTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

List<OnboardContent> onboardContents = [
    const OnboardContent(
      pageTitle: 'Buat Acara dan Undang\nTemanmu',
      description: 'Dengan membuat acara, isi detail acaramu,\nkemudian simpan acara, Janjian akan\nmengundang temanmu.',
      imagePath: 'assets/images/onboard1.png',
    ),
    const OnboardContent(
      pageTitle: 'Integrasi Waktu Luang',
      description: 'Dengan memastikan waktu luangmu\nJanjian dapat membantu kamu menemukan\njadwal ketemu yang pas.',
      imagePath: 'assets/images/onboard2.png',
    ),
    const OnboardContent(
      pageTitle: 'Lihat Daftar Janjian',
      description: 'Lihat semua daftar janjianmu dengan\nefisien untuk mengelola jadwalmu\nlebih teratur.',
      imagePath: 'assets/images/onboard3.png',
    ),
  ];