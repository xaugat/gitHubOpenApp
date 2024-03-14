import 'dart:convert';

import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/data_providers/user_data_provider.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/helpers.dart/applog.dart';
import 'package:fgitapp/helpers.dart/toast.dart';
import 'package:fgitapp/utils/pref_utils.dart';
import 'package:get_it/get_it.dart';

class UserRepositories {
  final apiProvider = GetIt.instance.get<UserDataProvider>();
  UserRepositories();
  Future<Either<List<UsersListResponseModel>, ErrorModel>>
      getAllUsersListRepo() async {
    var res = await apiProvider.getUsersList();

    if (res.statusCode == 200) {
      applog('fetched from api');
      List<UsersListResponseModel> data = List<UsersListResponseModel>.generate(
          res.data.length,
          (index) => UsersListResponseModel.fromJson(res.data[index]));
      SharedPref.setStringValue(ResString.dashboardSavedData, jsonEncode(data));
      return Left(data);
    } else {
      showErrorToast(ResString.error);
      return Right(ErrorModel(
          code: res.statusCode, success: false, message: res.statusMessage));
    }
  }

  Future<Either<List<UsersListResponseModel>, ErrorModel>> getSearchResultRepo(
      String query) async {
    var res = await apiProvider.getSearchQuery(query);

    if (res.statusCode == 200) {
      List<UsersListResponseModel> data = List<UsersListResponseModel>.generate(
          res.data['items'].length,
          (index) => UsersListResponseModel.fromJson(res.data['items'][index]));
      // SharedPref.setStringValue(ResString.dashboardSavedData, jsonEncode(data));
      return Left(data);
    } else {
      showErrorToast(ResString.error);
      return Right(ErrorModel(
          code: res.statusCode, success: false, message: res.statusMessage));
    }
  }

  Future<Either<List<UsersListResponseModel>, ErrorModel>>
      getAllUsersListRepoCached() async {
    var saveddata =
        await SharedPref.getStringValue(ResString.dashboardSavedData);
    List dashboardData = jsonDecode(saveddata);

    if (saveddata != "") {
      applog('fetched from cache');
      return Left(List<UsersListResponseModel>.generate(dashboardData.length,
          (index) => UsersListResponseModel.fromJson(dashboardData[index])));
    } else {
      showErrorToast("Nothing found on saved list");
      return Right(
          ErrorModel(code: 404, success: false, message: 'Couldnt fetch data'));
    }
  }

  Future<Either<UserDetailsResponseModel, ErrorModel>> getUserDetailsRepo(
      String userId) async {
    var res = await apiProvider.getUserDetails(userId);

    if (res.statusCode == 200) {
      return Left(UserDetailsResponseModel.fromJson(res.data));
    } else {
      showErrorToast(res.statusMessage.toString());
      return Right(ErrorModel(
          code: res.statusCode, success: false, message: res.statusMessage));
    }
  }

  Future<Either<List<UserProjectListResponseModel>, ErrorModel>>
      getUserProjectsListRepo(String userId) async {
    var res = await apiProvider.getUserProjectList(userId);

    if (res.statusCode == 200) {
      List<UserProjectListResponseModel> data =
          List<UserProjectListResponseModel>.generate(
              res.data.length,
              (index) =>
                  UserProjectListResponseModel.fromJson(res.data[index]));
      return Left(data);
    } else {
      showErrorToast(res.statusMessage.toString());
      return Right(ErrorModel(
          code: res.statusCode, success: false, message: res.statusMessage));
    }
  }
}
