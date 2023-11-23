import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login_button.dart';
import 'auth_form_field.dart';
import 'register_button.dart';
import '../../controller/login_controller.dart';
import '../../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F6),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 90, 32, 60),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/logo_login.png",
                width: 157,
                height: 158,
              ),
              Column(
                children: [
                  AuthFormField(
                    controller: loginC.email,
                    title: "Email",
                    hintText: "Alamat email anda",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 15),
                  AuthFormField(
                    controller: loginC.password,
                    title: "Kata Sandi",
                    hintText: "Kata sandi anda",
                    icon: Icons.email,
                    isPassword: true,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LoginButton(
                    buttonPressed: () async {
                      // await loginC.login();
                      // final box = GetStorage();
                      // if (box.read('access_token') != null) {
                      //   Get.offAllNamed(Routes.home);
                      // }
                      Get.offAllNamed(Routes.home);
                    }
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Belum Punya Akun ?",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RegisterButton(buttonPressed: () {Get.offNamed(Routes.register);}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}