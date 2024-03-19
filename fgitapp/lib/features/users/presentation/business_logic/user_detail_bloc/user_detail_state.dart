import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_detail_models.dart/user_detail_response_model.dart';
import 'package:fgitapp/features/users/domain/entity/user_detail_entity.dart';

class UserDetailState extends Equatable {
  const UserDetailState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class UserDetailInitial extends UserDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class GetUserDetailsSuccessState extends UserDetailState {
  final UserDetailsModel userDetailsResponseModel;
  const GetUserDetailsSuccessState({required this.userDetailsResponseModel});

  @override
  List<Object?> get props => [userDetailsResponseModel];
}

final class GetUserDetailsFailureState extends UserDetailState {
  final ErrorModel errorModel;
  const GetUserDetailsFailureState({required this.errorModel});

  @override
  // TODO: implement props
  List<Object?> get props => [errorModel];
}
