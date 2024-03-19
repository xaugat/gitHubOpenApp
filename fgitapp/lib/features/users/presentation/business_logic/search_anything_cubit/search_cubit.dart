import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgitapp/common/models/error_model.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';
import 'package:fgitapp/features/users/domain/use_cases/filter_user_usecase.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_usecase.dart';
import 'package:get_it/get_it.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final userRepo = GetIt.instance.get<FilterUserList>();

  searchDatafromQuery(query) async {
    var res = await userRepo(query);

    res.fold(
        (l) => emit(
            SearchDetailsFetchedSucessState(searchDetailsResponseModel: l)),
        (r) => emit(SearchDetailsErrorState(errorModel: r)));
  }
}
