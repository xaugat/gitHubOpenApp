// ignore_for_file: void_checks

import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState userInitialState) : super(userInitialState) {
    UserRepositories userRepo = UserRepositories();
    on<UserEvent>((event, emit) async {
      if (event is UserInitialEvent) {
        emit(const UserInitialState());
      } else if (event is GetAllUsersListEvent) {
        var result = await userRepo.getAllUsersListRepo();
        result.fold(
            (l) => emit(GetAllUsersSuccessState(usersListResponseModel: l)),
            (r) => emit(GetAllUsersFailureState(errorModel: r)));
      }
    });
  }
}
