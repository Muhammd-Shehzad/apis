import 'package:apis/data/Network/base_api_services.dart';
import 'package:apis/data/Network/networ_api_services.dart';
import 'package:apis/res/Components/app_url.dart';

class AuthRepositery {
  BaseApiServices _apiServices = NetworApiServices();

  Future<dynamic> loginApi(data) async {
    try {
      //here hit the api
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(data) async {
    try {
      //here hit the api
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerApiEndPoint,
        data,
      );
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
