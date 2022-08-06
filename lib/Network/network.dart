import 'package:dio/dio.dart';

class NetworkCalls {
  Future<dynamic> getHttp(String url) async {
    Response response;
       response = await Dio().get(url).timeout(const Duration(seconds: 120));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }

  }
}