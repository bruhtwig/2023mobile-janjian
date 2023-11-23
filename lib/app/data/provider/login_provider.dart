import 'package:get/get.dart';
import 'url.dart';

class LoginProvider extends GetConnect {
  final url = Url().getUrl("login");

  Future<Response> login(data) {
    return post(url, data);
  }
}