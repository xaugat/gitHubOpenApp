import 'package:fgitapp/features/users/domain/use_cases/user_detail_usecase.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_detail_bloc/user_detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:fgitapp/features/users/domain/use_cases/user_usecase.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_detail_bloc/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc(UserDetailState userDetailInitialState)
      : super(userDetailInitialState) {
    final userRepo = GetIt.instance.get<GetUserDetails>();
    on<UserDetailEvent>((event, emit) async {
      if (event is UserDetailInitialEvent) {
        emit(UserDetailInitial());
      } else if (event is GetUserDetailsEvent) {
        var result = await userRepo(event.userId);
        result.fold(
            (l) =>
                emit(GetUserDetailsSuccessState(userDetailsResponseModel: l)),
            (r) => GetUserDetailsFailureState(errorModel: r));
      }
    });
  }
}
