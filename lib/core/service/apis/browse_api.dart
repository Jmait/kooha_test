import 'package:dio/dio.dart';

import 'package:kooha_test/core/service/network/config.dart';

class BrowseCelebApi {
  Future<Response> getFeaturedCelebrity() async {
    NetworkClass _networkClass = NetworkClass(
      authToken: await Storage.getToken(),
    );
    Response response = await _networkClass.call(
      '/users/featured?type=CELEBRITY',
      RequestMethod.get,
    );
    return response;
  }

  Future<Response> getTrendingCelebrity() async {
    NetworkClass _networkClass = NetworkClass(
      authToken: await Storage.getToken(),
    );
    Response response = await _networkClass.call(
      '/users/trending?type=CELEBRITY',
      RequestMethod.get,
    );
    return response;
  }

  Future<Response> getCelebrityDetails(String? id) async {
    NetworkClass _networkClass = NetworkClass(
      authToken: await Storage.getToken(),
    );
    Response response = await _networkClass.call(
      '/users/$id',
      RequestMethod.get,
    );
    return response;
  }

  Future<Response> searchCelebApi(String? name) async {
    NetworkClass _networkClass = NetworkClass(
      authToken: await Storage.getToken(),
    );

    Response response = await _networkClass.call(
      '/users?type=CELEBRITY&page=1&limit=&q=$name',
      RequestMethod.get,
    );
    return response;
  }
}
