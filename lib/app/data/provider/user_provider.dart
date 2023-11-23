import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'url.dart';

class UserProvider extends GetConnect {
  final url = Url().getUrl("user");

  @override
  void onInit() {
    final box = GetStorage();
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = "Bearer ${box.read('access_token')}";
      return request;
    });
  }

  Future<Response> getData() {
    return get(url);
  }

  Future<Response> patchData(data) {
    return patch(url, data);
  }
}