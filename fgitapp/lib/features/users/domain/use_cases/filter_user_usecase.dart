import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';

import '../../../../core/use_cases/common_use_cases.dart';

class FilterUserList implements UseCase<List<UsersListModel>, String> {
  UserDataRepository userDataRepository;
  FilterUserList(this.userDataRepository);

  @override
  ResultFuture<List<UsersListModel>> call(userId) async {
    return await userDataRepository.searchUserDataList(userId);
  }
}
