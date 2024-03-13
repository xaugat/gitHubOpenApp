part of 'user_detail_bloc.dart';

sealed class UserDetailEvent {
  const UserDetailEvent();

  // @override
  // List<Object> get props => [];
}

class UserDetailInitialEvent extends UserDetailEvent {
  UserDetailInitialEvent();
}

class GetUserDetailsEvent extends UserDetailEvent {
  final String userId;
  const GetUserDetailsEvent({required this.userId});
}
