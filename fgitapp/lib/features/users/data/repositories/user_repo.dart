import 'dart:convert';

import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/core/errors/exceptions.dart';
import 'package:fgitapp/core/errors/failures.dart';
import 'package:fgitapp/features/users/data/data_providers/api_data_providers/user_data_api_provider.dart';
import 'package:fgitapp/features/users/data/data_providers/api_data_providers/user_data_api_provider_imp.dart';
import 'package:fgitapp/features/users/data/data_providers/local_data_providers/user_data_local_provider.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';
import 'package:fgitapp/helpers.dart/applog.dart';
import 'package:fgitapp/helpers.dart/toast.dart';
import 'package:fgitapp/core/utils/pref_utils.dart';
import 'package:fgitapp/core/utils/type_def.dart';
import 'package:get_it/get_it.dart';

typedef ConvertToUserListEntity = Future<List<UsersListModel>> Function();
// ignore: prefer_generic_function_type_aliases
typedef Future<UserDetailsModel> ConvertToUserDetailEntity();

class UserDataRepositoriesImpl implements UserDataRepository {
  final apiProvider = GetIt.instance.get<UserDataApiSource>();
  UserDataRepositoriesImpl();

  @override
  ResultFuture<List<UsersListModel>> getUserDataList() async {
    return await convertToUserListEntity(() {
      return apiProvider.getUserList();
    });
  }

  @override
  ResultFuture<UserDetailsModel> getUserDetail(userId) async {
    return await convertToUserDetailEntity(() {
      return apiProvider.getUserDetails(userId);
    });
  }

  ResultFuture<List<UsersListModel>> convertToUserListEntity(
      ConvertToUserListEntity convertToEntity) async {
    final remoteData = await convertToEntity();
    try {
      return Left(remoteData);
    } catch (e) {
      return Right(ErrorModel());
    }
  }

  ResultFuture<UserDetailsModel> convertToUserDetailEntity(
      ConvertToUserDetailEntity convertToUserDetailEntity) async {
    final remoteData = await convertToUserDetailEntity();
    try {
      return Left(remoteData);
    } catch (e) {
      return Right(ErrorModel());
    }
  }

  @override
  ResultFuture<List<UsersListModel>> searchUserDataList(userId) async {
    return await convertToUserListEntity(() {
      return apiProvider.searchUserList(userId);
    });
  }

  // @override
  // ResultFuture<UsersListModel> getUserRepoDetails() {
  //   // TODO: implement getUserRepoDetails
  //   throw UnimplementedError();
  // }
}
