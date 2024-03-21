// ignore_for_file: prefer_const_constructors

import 'package:fgitapp/features/users/data/data_providers/api_data_providers/user_data_api_provider.dart';
import 'package:fgitapp/features/users/data/data_providers/api_data_providers/user_data_api_provider_imp.dart';
import 'package:fgitapp/core/networks/dio_request.dart';
import 'package:fgitapp/features/users/data/data_providers/local_data_providers/user_data_local_provider.dart';
import 'package:fgitapp/features/users/data/repositories/user_repo.dart';
import 'package:fgitapp/features/users/domain/repository/user_repositories.dart';
import 'package:fgitapp/features/users/domain/use_cases/filter_user_usecase.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_detail_usecase.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_repo_details_usecase.dart';
import 'package:fgitapp/features/users/domain/use_cases/user_usecase.dart';
import 'package:fgitapp/features/users/presentation/business_logic/search_anything_cubit/search_cubit.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_detail_bloc/user_detail_bloc.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_detail_bloc/user_detail_state.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_repo_cubit/user_projects_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future setupDi(String baseUrl) async {
  getIt.registerFactory<CallApi>(() => CallApi(
      (baseUrl))); // injecting base url from root of app for build flavor

  getIt.registerSingleton<UserDataApiSource>(UserDataApiSourceImpl(getIt()));

  // injecting the repositories so that it will use the same instance all over the app

  getIt.registerSingleton<UserDataRepository>(UserDataRepositoriesImpl());
  getIt.registerSingleton<GetUserList>(GetUserList(getIt()));

  getIt.registerSingleton<GetUserDetails>(GetUserDetails(getIt()));

  getIt.registerSingleton<FilterUserList>(FilterUserList(getIt()));

  getIt.registerSingleton<GetUserRepoDetails>(GetUserRepoDetails(getIt()));

  // injecting the blocs so that it will use the same instance all over the app
  getIt.registerSingleton<UserBloc>(UserBloc(UserInitialState()));
  getIt.registerSingleton<UserDetailBloc>(UserDetailBloc(UserDetailInitial()));
  getIt.registerSingleton<UserProjectsCubit>(UserProjectsCubit());
  getIt.registerSingleton<SearchCubit>(SearchCubit());
}
