// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fgitapp/common/models/error_model.dart';
// import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
// import 'package:fgitapp/features/users/data/repositories/user_repo.dart';

// part 'user_detail_event.dart';
// part 'user_detail_state.dart';

// class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
//   UserDetailBloc(UserDetailState userDetailInitialState)
//       : super(userDetailInitialState) {
//     UserRepositories userRepo = UserRepositories();
//     on<UserDetailEvent>((event, emit) async {
//       if (event is UserDetailInitialEvent) {
//         emit(UserDetailInitial());
//       } else if (event is GetUserDetailsEvent) {
//         var result = await userRepo.getUserDetailsRepo(event.userId);
//         result.fold(
//             (l) =>
//                 emit(GetUserDetailsSuccessState(userDetailsResponseModel: l)),
//             (r) => GetUserDetailsFailureState(errorModel: r));
//       }
//     });
//   }
// }
