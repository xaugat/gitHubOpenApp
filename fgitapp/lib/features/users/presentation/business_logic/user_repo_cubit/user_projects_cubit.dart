import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_project_list_models.dart/user_projects_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_detail_usecase.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_repo_details_usecase.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_repo_cubit/user_projects_state.dart';
import 'package:get_it/get_it.dart';

class UserProjectsCubit extends Cubit<UserProjectsState> {
  UserProjectsCubit() : super(UserProjectsInitial());
  final userRepo = GetIt.instance.get<GetUserRepoDetails>();

  getUsersProjectsList(String userId) async {
    var res = await userRepo(userId);

    res.fold(
        (l) => emit(
            UserProjectsFetchedSucessState(usersProjectListResponseModel: l)),
        (r) => emit(UserProjectsFetchedFailureState(errorModel: r)));
  }
}
