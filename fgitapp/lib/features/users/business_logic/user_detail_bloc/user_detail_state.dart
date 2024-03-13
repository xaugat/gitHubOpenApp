part of 'user_detail_bloc.dart';

sealed class UserDetailState {
  const UserDetailState();

  // @override
  // List<Object> get props => [];
}

final class UserDetailInitial extends UserDetailState {}

final class GetUserDetailsSuccessState extends UserDetailState {
  final UserDetailsResponseModel userDetailsResponseModel;
  const GetUserDetailsSuccessState({required this.userDetailsResponseModel});
}

final class GetUserDetailsFailureState extends UserDetailState {
  final ErrorModel errorModel;
  const GetUserDetailsFailureState({required this.errorModel});
}
