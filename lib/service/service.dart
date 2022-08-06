import 'package:drinks/model/data_model.dart';
import '../Network/api_endpoints.dart';
import '../Network/network.dart';
import 'package:dio/dio.dart';

class ServiceApi {
  final netWorkCalls = NetworkCalls();

  Future<dynamic> getNews() async {
    Response response = await netWorkCalls.getHttp(baseUrl);
    return DrinksModel.fromJson(response.data);
  }
}
