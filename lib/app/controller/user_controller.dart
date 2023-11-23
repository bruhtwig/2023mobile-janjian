import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/model/user.dart';
import '../data/provider/user_provider.dart';

class UserController extends GetxController {
  var user = User().obs;

  final name = TextEditingController();
  final email = TextEditingController();

  final userP = Get.put(UserProvider());
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // box.hasData('user') ? setUser() : getUser();
  }

  void setUser() {
    name.text = box.read('user')['name'];
    email.text = box.read('user')['email'];
  }

  void getUser() async {
    var response = await userP.getData();
    user.value = User.fromJson(response.body['data']);
    box.write('user', response.body['data']);
    setUser();
  }

  void editUser() async {
    var response = await userP.patchData({"name":name.text});
    user.value = User.fromJson(response.body['data']);
    box.write('user', response.body['data']);
    setUser();
  }

  void logout() {
    name.text = '';
    email.text = '';
    box.erase();
  }
}