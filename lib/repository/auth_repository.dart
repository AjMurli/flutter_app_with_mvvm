import 'package:flutter_app_with_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_app_with_mvvm/data/network/NetworkApiServices.dart';
import 'package:flutter_app_with_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetwrokdApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
