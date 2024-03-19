import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/core/use_cases/common_use_cases.dart';
import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';
import 'package:get_it/get_it.dart';

class GetUserList implements UseCase<List<UsersListModel>, NoParams> {
  UserDataRepository userDataRepository;
  GetUserList(this.userDataRepository);

  @override
  ResultFuture<List<UsersListModel>> call(NoParams params) async {
    return await userDataRepository.getUserDataList();
  }
}
