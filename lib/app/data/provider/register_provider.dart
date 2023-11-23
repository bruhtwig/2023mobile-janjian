import 'package:get/get.dart';
import 'url.dart';

class RegisterProvider extends GetConnect {
  final url = Url().getUrl("register");

  Future<Response> register(data) {
    return post(url, data);
  }
}