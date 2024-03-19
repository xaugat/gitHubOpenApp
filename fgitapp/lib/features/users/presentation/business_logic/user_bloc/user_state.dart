part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class GetAllUsersSuccessState extends UserState {
  final List<UsersListModel> usersListResponseModel;

  const GetAllUsersSuccessState({required this.usersListResponseModel});
}

class GetAllUsersLoadingState extends UserState {
  const GetAllUsersLoadingState();
}

class GetAllUsersFailureState extends UserState {
  final ErrorModel errorModel;
  const GetAllUsersFailureState({required this.errorModel});
}
