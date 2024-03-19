import 'package:equatable/equatable.dart';

abstract class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object> get props => [];
}

class UserDetailInitialEvent extends UserDetailEvent {
  UserDetailInitialEvent();
}

class GetUserDetailsEvent extends UserDetailEvent {
  final String userId;
  const GetUserDetailsEvent({required this.userId});
}
