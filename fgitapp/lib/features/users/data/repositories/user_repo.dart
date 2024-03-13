import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/data_providers/user_data_provider.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:fgitapp/helpers.dart/applog.dart';
import 'package:fgitapp/helpers.dart/toast.dart';
import 'package:fgitapp/utils/string_constants.dart';
import 'package:get_it/get_it.dart';

class UserRepositories {
  final apiProvider = GetIt.instance.get<UserDataProvider>();
  UserRepositories();
  Future<Either<List<UsersListResponseModel>, ErrorModel>>
      getAllUsersListRepo() async {
    var res = await apiProvider.getUsersList();

    if (res != null) {
      if (res.statusCode == 200) {
        return Left(List<UsersListResponseModel>.generate(res.data.length,
            (index) => UsersListResponseModel.fromJson(res.data[index])));
      } else {
        showErrorToast(res.toString());
        return Right(ErrorModel(
            code: res.statusCode, success: false, message: res.statusMessage));
      }
    } else {
      showErrorToast(ResString.serverError);
      return Right(ErrorModel(
        code: 500,
        success: false,
        message: 'Error',
      ));
    }
  }

  Future<Either<UserDetailsResponseModel, ErrorModel>> getUserDetailsRepo(
      String userId) async {
    var res = await apiProvider.getUserDetails(userId);

    if (res != null) {
      if (res.statusCode == 200) {
        return Left(UserDetailsResponseModel.fromJson(res.data));
      } else {
        showErrorToast(res.toString());
        return Right(ErrorModel(
            code: res.statusCode, success: false, message: res.statusMessage));
      }
    } else {
      showErrorToast(ResString.serverError);
      return Right(ErrorModel(
        code: 500,
        success: false,
        message: 'Error',
      ));
    }
  }
}
