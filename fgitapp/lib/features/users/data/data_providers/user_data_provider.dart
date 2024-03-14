import 'package:dio/dio.dart';
import 'package:fgitapp/common/constants/api_constants.dart';
import 'package:fgitapp/common/networks/dio_request.dart';

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

  Future<Response> getUserProjectList(String userId) async {
    var userProjectListResponse = await callApi
        .getData(ApiUrls.getUserReposList.replaceFirst('__userid__', userId));
    return userProjectListResponse;
  }

  Future<Response> getSearchQuery(String query) async {
    var userProjectListResponse =
        await callApi.getData(ApiUrls.search.replaceFirst('__query__', query));
    return userProjectListResponse;
  }
}
