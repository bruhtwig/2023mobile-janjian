import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      final box = GetStorage();
      box.hasData('access_token')
          ? Get.offNamed(Routes.home)
          : Get.offNamed(Routes.onboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.8,
              1.0,
            ],
            colors: [
              Color(0xFFA3CFEA),
              Color(0xFFEEF5FC),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              // 'assets/images/logo_splash.png',
              height: 250,
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'janjikan ',
                      style: TextStyle(
                        color: Color(0xFFFF9711),
                      ),
                    ),
                    TextSpan(
                      text: 'Janjian ',
                      style: TextStyle(
                        color: Color(0xFF1DA1F2),
                      ),
                    ),
                    TextSpan(
                      text: 'kamu',
                      style: TextStyle(
                        color: Color(0xFFFF9711),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
