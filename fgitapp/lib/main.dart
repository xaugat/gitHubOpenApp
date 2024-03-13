import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/business_logic/user_detail_bloc/user_detail_bloc.dart';
import 'package:fgitapp/injector.dart/app_injector.dart';
import 'package:fgitapp/helpers.dart/get_root_url.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  AppBuilder.runWithConfig(
    BuildFlavor.live,
  ); // this is how you set build flavor for various types
}

enum BuildFlavor { local, dev, staging, live }

class AppBuilder {
  static runWithConfig(BuildFlavor buildFlavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupDi(
        getRootUrl(buildFlavor)); // build app according to build flavor

    runApp(MyApp(buildFlavor: buildFlavor));
  }
}

class MyApp extends StatelessWidget {
  final BuildFlavor buildFlavor;
  const MyApp({super.key, required this.buildFlavor});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // registering all the instance of bloc used in the initial phase.
      providers: [
        BlocProvider<UserBloc>(
            create: (BuildContext context) =>
                UserBloc(const UserInitialState())),
        BlocProvider<UserDetailBloc>(
            create: (BuildContext context) =>
                UserDetailBloc(UserDetailInitial())),
      ],
      child: MaterialApp(
        title: 'GitApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserListPage(),
      ),
    );
  }
}
