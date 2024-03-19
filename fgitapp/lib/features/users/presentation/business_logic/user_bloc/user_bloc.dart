// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/core/use_cases/common_use_cases.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:fgitapp/core/utils/pref_utils.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState userInitialState) : super(userInitialState) {
    final userRepo = GetIt.instance.get<GetUserList>();
    on<UserEvent>((event, emit) async {
      if (event is UserInitialEvent) {
        emit(const UserInitialState());
      } else if (event is GetAllUsersListEvent) {
        var res = await userRepo.call(NoParams());

        res.fold(
            (l) => emit(GetAllUsersSuccessState(usersListResponseModel: l)),
            (r) => emit(GetAllUsersFailureState(errorModel: r)));
      }
    });
  }
}
