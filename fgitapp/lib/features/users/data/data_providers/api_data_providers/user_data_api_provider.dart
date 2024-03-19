import 'package:fgitapp/core/utils/type_def.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_repo_list_page.dart';

abstract class UserDataApiSource {
  Future<List<UsersListResponseModel>> getUserList();
  Future<UserDetailsResponseModel> getUserDetails(String userId);
  Future<List<UserProjectListResponseModel>> getUserProjectsListRepo(
      String userId);
  Future<List<UsersListResponseModel>> searchUserList(String userId);
}
