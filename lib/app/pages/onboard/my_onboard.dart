import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboard_button.dart';
import 'onboard_content.dart';
import '../../routes/app_routes.dart';

class OnBoardPage extends StatelessWidget {
  OnBoardPage({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F6),
      body: Container(
        padding: const EdgeInsets.fromLTRB(32, 80, 32, 35),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            janjianText(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: onboardContents,
              ),
            ),
            Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 5,
                    dotWidth: 15,
                    activeDotColor: Color(0xff1DA1F2),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                OnboardButton(
                  buttonText: 'Daftar',
                  buttonPressed: () {
                    Get.toNamed(Routes.register);
                  },
                  buttonColor: const Color(0xFF1DA1F2),
                  textColor: const Color(0xFFFFFFFF),
                ),
                const SizedBox(
                  height: 14,
                ),
                OnboardButton(
                  buttonText: 'Masuk',
                  buttonPressed: () {
                    Get.toNamed(Routes.login);
                  },
                  buttonColor: const Color(0xFFEFEFEF),
                  textColor: const Color(0xFF1DA1F2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget janjianText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: 'Poppins',
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Janji',
            style: TextStyle(
              color: Color(0xFFFF9711),
            ),
          ),
          TextSpan(
            text: 'an',
            style: TextStyle(
              color: Color(0xFF1DA1F2),
            ),
          ),
        ],
      ),
    );
  }
}