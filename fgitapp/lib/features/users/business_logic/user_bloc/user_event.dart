part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class GetAllUsersListEvent extends UserEvent {
  const GetAllUsersListEvent();
}
