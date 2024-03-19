import 'package:fgitapp/features/users/presentation/ui/pages/search_filter_page.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_detail_page.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_list_page.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_repo_list_page.dart';
import 'package:fgitapp/helpers.dart/show_error.dart';
import 'package:fgitapp/config/router/route_paths.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => UserListPage(),
        );
      // case RoutePaths.userDetailPage:
      //   args as String;
      //   return MaterialPageRoute(
      //     builder: (_) => UserDetailPage(
      //       userId: args,
      //     ),
      //   );
      // case RoutePaths.userRepoPage:
      //   args as String;
      //   return MaterialPageRoute(
      //     builder: (_) => UserRepoListPage(
      //       userId: args,
      //     ),
      //   );
      // case RoutePaths.searchPage:
      //   return MaterialPageRoute(
      //     builder: (_) => SearchFilterPage(),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return ShowErrorPage();
    });
  }
}
