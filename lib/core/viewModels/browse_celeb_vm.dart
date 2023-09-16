import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kooha_test/core/models/celebrity_data.model.dart';
import 'package:kooha_test/locator.dart';
import 'package:stacked/stacked.dart';

import '../service/apis/browse_api.dart';

class BrowseViewModel extends BaseViewModel {
  final BrowseCelebApi _authApi = locator<BrowseCelebApi>();
  CelebrityDataModel? _celebrityDataModel;
  Records? _celebDetails;
  Records? get celebDetails => _celebDetails;
  CelebrityDataModel? _trendingDataModel;
  CelebrityDataModel? get celebDataModel => _celebrityDataModel;
  CelebrityDataModel? get trendingCelebDataModel => _trendingDataModel;

  Future<void> getTrendingCeleb() async {
    try {
      setBusy(true);
      Response response = await _authApi.getTrendingCelebrity();
      _trendingDataModel = CelebrityDataModel.fromJson(response.data);
      print(_trendingDataModel?.data?.records);
      setBusy(false);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getFeaturedCeleb() async {
    try {
      setBusy(true);
      Response response = await _authApi.getFeaturedCelebrity();
      _celebrityDataModel = CelebrityDataModel.fromJson(response.data);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      print(e);
    }
  }

  Future<void> getCelebDetails(String? id) async {
    try {
      setBusy(true);
      Response response = await _authApi.getCelebrityDetails(id);
      _celebDetails = Records.fromJson(response.data['data']);
      print(_celebDetails?.fullName);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      print(e);
    }
  }

  Future<void> searchCeleb(String? name) async {
    try {
      setBusy(true);
      Response response = await _authApi.searchCelebApi(name);
      print(response);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      print(e);
    }
  }
}
