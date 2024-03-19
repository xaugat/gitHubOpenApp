part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchDetailsFetchedSucessState extends SearchState {
  final List<UsersListModel> searchDetailsResponseModel;
  SearchDetailsFetchedSucessState({required this.searchDetailsResponseModel});
}

final class SearchDetailsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchDetailsErrorState({required this.errorModel});
}
