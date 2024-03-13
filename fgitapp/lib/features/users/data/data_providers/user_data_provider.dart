import 'package:dio/dio.dart';
import 'package:fgitapp/common/networks/dio_request.dart';
import 'package:fgitapp/utils/api_constants.dart';

class UserDataProvider {
  CallApi callApi;

  UserDataProvider(this.callApi);

  Future<Response> getUsersList() async {
    var userResponse = await callApi.getData(ApiUrls.getAllusers);
    return userResponse;
  }

  Future<Response> getUserDetails(String userId) async {
    var userResponse = await callApi
        .getData(ApiUrls.getUserDetails.replaceFirst('__userid__', userId));
    return userResponse;
  }
}
