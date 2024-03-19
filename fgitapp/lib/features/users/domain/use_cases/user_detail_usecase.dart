import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';

import '../../../../core/use_cases/common_use_cases.dart';

class GetUserDetails implements UseCase<UserDetailsModel, String> {
  UserDataRepository userDataRepository;
  GetUserDetails(this.userDataRepository);
  @override
  ResultFuture<UserDetailsModel> call(userId) async {
    return await userDataRepository.getUserDetail(userId);
  }
}
