import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'url.dart';

class AgendaProvider extends GetConnect {
  final url = Url().getUrl("user/agenda");

  @override
  void onInit() {
    final box = GetStorage();
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = "Bearer ${box.read('access_token')}";
      return request;
    });
  }
  Future<Response> postData(data) {
    return post(url, data);
  }

  Future<Response> getOutboxData() {
    return get(url);
  }

  Future<Response> getInboxData() {
    return get("${url}User");
  }

  Future<Response> putData(id, data) {
    return put("$url/$id", data);
  }

  Future<Response> deleteData(id) {
    return delete("$url/$id");
  }
}