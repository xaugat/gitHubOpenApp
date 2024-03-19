import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fgitapp/common/constants/api_constants.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/core/errors/exceptions.dart';
import 'package:fgitapp/core/networks/dio_request.dart';
import 'package:fgitapp/core/utils/pref_utils.dart';
import 'package:fgitapp/features/users/data/data_providers/api_data_providers/user_data_api_provider.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/helpers.dart/applog.dart';
import 'package:fgitapp/helpers.dart/toast.dart';

import '../../../../../core/utils/type_def.dart';

class UserDataApiSourceImpl implements UserDataApiSource {
  CallApi callApi;

  UserDataApiSourceImpl(this.callApi);

  ResultFuture<UserDetailsResponseModel> getUserDetailsRepo(
      String userId) async {
    var res = await callApi
        .getData(ApiUrls.getUserDetails.replaceFirst('__userid__', userId));

    if (res.statusCode == 200) {
      return Left(UserDetailsResponseModel.fromJson(res.data));
    } else {
      showErrorToast(res.statusMessage.toString());
      return Right(ErrorModel(
          code: res.statusCode, success: false, message: res.statusMessage));
    }
  }

  @override
  Future<List<UserProjectListResponseModel>> getUserProjectsListRepo(
      String userId) async {
    var res = await callApi
        .getData(ApiUrls.getUserReposList.replaceFirst('__userid__', userId));

    if (res.statusCode == 200) {
      List<UserProjectListResponseModel> data =
          List<UserProjectListResponseModel>.generate(
              res.data.length,
              (index) =>
                  UserProjectListResponseModel.fromJson(res.data[index]));
      return data;
    } else {
      showErrorToast(res.statusMessage.toString());
      throw ServerException();
    }
  }

  @override
  Future<UserDetailsResponseModel> getUserDetails(String userId) async {
    var res = await callApi
        .getData(ApiUrls.getUserDetails.replaceFirst('__userid__', userId));

    if (res.statusCode == 200) {
      return UserDetailsResponseModel.fromJson(res.data);
    } else {
      showErrorToast(res.statusMessage.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<UsersListResponseModel>> getUserList() async {
    var res = await callApi.getData(ApiUrls.getAllusers);

    if (res.statusCode == 200) {
      applog('fetched from api');
      List<UsersListResponseModel> data = List<UsersListResponseModel>.generate(
          res.data.length,
          (index) => UsersListResponseModel.fromJson(res.data[index]));
      SharedPref.setStringValue(ResString.dashboardSavedData, jsonEncode(data));
      return data;
    } else {
      showErrorToast(ResString.error);
      throw ServerException();
    }
  }

  @override
  Future<List<UsersListResponseModel>> searchUserList(String query) async {
    var res =
        await callApi.getData(ApiUrls.search.replaceFirst('__query__', query));

    if (res.statusCode == 200) {
      List<UsersListResponseModel> data = List<UsersListResponseModel>.generate(
          res.data['items'].length,
          (index) => UsersListResponseModel.fromJson(res.data['items'][index]));

      return data;
    } else {
      showErrorToast(ResString.error);
      throw ServerException();
    }
  }
}
