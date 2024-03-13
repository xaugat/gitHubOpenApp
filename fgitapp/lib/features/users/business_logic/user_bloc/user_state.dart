part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {
  const UserInitialState();
}

final class GetAllUsersSuccessState extends UserState {
  final List<UsersListResponseModel> usersListResponseModel;

  const GetAllUsersSuccessState({required this.usersListResponseModel});
}

final class GetAllUsersLoadingState extends UserState {
  const GetAllUsersLoadingState();
}

final class GetAllUsersFailureState extends UserState {
  final ErrorModel errorModel;
  const GetAllUsersFailureState({required this.errorModel});
}
