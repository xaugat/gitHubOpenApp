import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';

part 'user_projects_state.dart';

class UserProjectsCubit extends Cubit<UserProjectsState> {
  UserProjectsCubit() : super(UserProjectsInitial());
  UserRepositories userRepo = UserRepositories();

  getUsersProjectsList(String userId) async {
    var res = await userRepo.getUserProjectsListRepo(userId);

    res.fold(
        (l) => emit(
            UserProjectsFetchedSucessState(usersProjectListResponseModel: l)),
        (r) => emit(UserProjectsFetchedFailureState(errorModel: r)));
  }
}
