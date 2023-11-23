import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/provider/register_provider.dart';

class RegisterController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> register() async {
    var data = {
      'name' : name.text,
      'email': email.text,
      'password': password.text,
    };
    var response = await RegisterProvider().register(data);
    final box = GetStorage();
    box.write('access_token', response.body['data']['access_token']);
  }
}