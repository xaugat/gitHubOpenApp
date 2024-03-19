import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';

abstract class UserDataRepository {
  ResultFuture<List<UsersListModel>> getUserDataList();

  // ResultFuture<UsersListModel> getUserDetail(loginId);

  // ResultFuture<UsersListModel> getUserRepoDetails(loginId);
}
