import 'package:nyp19vp_mb/constants/api_path.dart';
import 'package:nyp19vp_mb/data/network/base_api_services.dart';
import 'package:nyp19vp_mb/data/network/network_api_services.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.loginApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          ApiUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> validate(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          ApiUrl.validateApiEndPoint, token);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
