import 'package:fgitapp/core/use_cases/common_use_cases.dart';
import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';
import 'package:fgitapp/features/users/domain/entity/user_repo_detail_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';

class GetUserRepoDetails implements UseCase<List<RepositoryEntity>, String> {
  UserDataRepository userDataRepository;
  GetUserRepoDetails(this.userDataRepository);
  @override
  ResultFuture<List<RepositoryEntity>> call(userId) async {
    return await userDataRepository.getUserRepoDetails(userId);
  }
}
