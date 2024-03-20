import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/features/users/domain/entity/user_repo_detail_entity.dart';

sealed class UserProjectsState {
  const UserProjectsState();
}

final class UserProjectsInitial extends UserProjectsState {
  const UserProjectsInitial();
}

final class UserProjectsFetchedSucessState extends UserProjectsState {
  final List<RepositoryEntity> usersProjectListResponseModel;
  const UserProjectsFetchedSucessState(
      {required this.usersProjectListResponseModel});
}

final class UserProjectsFetchedFailureState extends UserProjectsState {
  final ErrorModel errorModel;
  const UserProjectsFetchedFailureState({required this.errorModel});
}
