import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/entity/user_repo_detail_entity.dart';

abstract class UserDataRepository {
  ResultFuture<List<UsersListModel>> getUserDataList();

  ResultFuture<List<UsersListModel>> searchUserDataList(userId);

  ResultFuture<UserDetailsModel> getUserDetail(loginId);

  ResultFuture<List<RepositoryEntity>> getUserRepoDetails(loginId);
}
