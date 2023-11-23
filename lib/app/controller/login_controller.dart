import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/provider/login_provider.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    var data = {
      'email': email.text,
      'password': password.text,
    };
    var response = await LoginProvider().login(data);
    if(response.statusCode == 200){
      final box = GetStorage();
      box.write('access_token', response.body['data']['access_token']);
    }
  }
}