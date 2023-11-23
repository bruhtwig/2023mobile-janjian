class Url {
  final base = "";
  final api = "api/v1/";

  String getUrl(String endpoint) {
    return base+api+endpoint;
  }
}