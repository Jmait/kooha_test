import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kooha_test/core/service/apis/auth_api.dart';
import 'package:kooha_test/locator.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthApi _authApi = locator<AuthApi>();

  Future<bool> loginUser(String? email, String? password) async {
    FlutterSecureStorage _storage = new FlutterSecureStorage();
    bool isSuccess = false;
    try {
      setBusy(true);
      Response response = await _authApi.login(
        email,
        password,
      );
      isSuccess = true;

      _storage.write(key: 'token', value: response.data['data']['token']);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      print(e);
    }
    return isSuccess;
  }
}
