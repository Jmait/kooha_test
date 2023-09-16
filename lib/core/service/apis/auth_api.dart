import 'package:dio/dio.dart';
import 'package:kooha_test/core/service/network/config.dart';

class AuthApi {
  NetworkClass _networkClass = NetworkClass();
  Future<Response> login(String? email, String? password) async {
    Response response =
        await _networkClass.call('/auth/login', RequestMethod.post, data: {
      'email': email,
      'password': password,
    });

    return response;
  }
}
