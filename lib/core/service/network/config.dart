import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage _storage = new FlutterSecureStorage();

class Storage {
  static Future<String?> getToken() async {
    print(await _storage.read(key: 'token'));
    return await _storage.read(key: 'token');
  }
}

class NetworkClass {
  Dio dio = new Dio();
  String? _token;

  NetworkClass({String? authToken}) {
    Map<String, dynamic> headers = {
      'authorization': 'Bearer $authToken'
      //Other headers parameters goes here;
    };
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dev-api.kooha.com/v1',
        headers: headers,
        connectTimeout: Duration(milliseconds: 30000),
        sendTimeout: Duration(milliseconds: 30000),
        receiveTimeout: Duration(milliseconds: 30000),
      ),
    );
  }

  Future<Response> call(String path, RequestMethod method,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? data,
      FormData? formData}) async {
    Response response;
    var params = queryParams ?? {};
    params.addAll(requiredParams);
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path,
              queryParameters: params, data: data ?? formData);
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(path, queryParameters: params, data: data);
          break;
        case RequestMethod.patch:
          response = await dio.patch(path, queryParameters: params, data: data);
          break;
        case RequestMethod.delete:
          response =
              await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          throw UnimplementedError();
      }
      return response;
    } on DioException catch (error, stackTrace) {
      return Future.error(error.response as Object, stackTrace);
    }
  }

  Map<String, dynamic> get requiredParams {
    Map<String, dynamic> params = {};
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload, patch }
