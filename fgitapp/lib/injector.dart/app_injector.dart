// ignore_for_file: prefer_const_constructors

import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/business_logic/user_detail_bloc/user_detail_bloc.dart';
import 'package:fgitapp/features/users/business_logic/user_repo_cubit/user_projects_cubit.dart';
import 'package:fgitapp/features/users/data/data_providers/user_data_provider.dart';
import 'package:fgitapp/common/networks/dio_request.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future setupDi(String baseUrl) async {
  getIt.registerFactory<CallApi>(() => CallApi(
      (baseUrl))); // injecting base url from root of app for build flavor

  // getIt.registerSingleton<UserDataProvider>(UserDataProvider(getIt()));

  getIt.registerSingleton<UserDataProvider>(UserDataProvider(getIt()));

  // injecting the repositories so that it will use the same instance all over the app
  getIt.registerSingleton<UserBloc>(UserBloc(UserInitialState()));
  getIt.registerSingleton<UserDetailBloc>(UserDetailBloc(UserDetailInitial()));
  getIt.registerSingleton<UserProjectsCubit>(UserProjectsCubit());
}
