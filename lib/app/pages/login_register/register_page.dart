import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login_button.dart';
import 'auth_form_field.dart';
import 'register_button.dart';
import '../../controller/register_controller.dart';
import '../../routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final registerC = Get.put(RegisterController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: ('Buat Akun\nBaru!'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    height: 1.5,
                    color: Color(0xFF032068),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthFormField(
                    controller: registerC.name,
                    title: "Nama Pengguna",
                    hintText: "Nama anda",
                    icon: Icons.people,
                  ),
                  const SizedBox(height: 15),
                  AuthFormField(
                    controller: registerC.email,
                    title: "Email",
                    hintText: "Alamat email anda",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 15),
                  AuthFormField(
                    controller: registerC.password,
                    title: "Kata Sandi",
                    hintText: "Kata sandi anda",
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegisterButton(
                    buttonPressed: () async {
                      // await registerC.register();
                      // final box = GetStorage();
                      // if(box.read('access_token') != null) {
                      //   Get.offAllNamed(Routes.home);
                      // }
                      Get.offAllNamed(Routes.home);
                    },
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Sudah Punya Akun?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  LoginButton(buttonPressed: () {Get.offNamed(Routes.login);}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
