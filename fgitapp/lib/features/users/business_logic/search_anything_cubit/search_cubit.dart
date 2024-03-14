import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  UserRepositories userRepo = UserRepositories();

  searchDatafromQuery(query) async {
    var res = await userRepo.getSearchResultRepo(query);

    res.fold(
        (l) => emit(
            SearchDetailsFetchedSucessState(searchDetailsResponseModel: l)),
        (r) => emit(SearchDetailsErrorState(errorModel: r)));
  }
}
