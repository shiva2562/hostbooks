import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostbooks/Bloc/git_repos_bloc/git_repos_bloc.dart';
import 'package:hostbooks/Presentation/git_repo_page.dart';
import 'package:hostbooks/Util/constants.dart';

import '../Bloc/git_users_bloc/git_users_bloc.dart';
import '../Presentation/git_user_page.dart';

class AppRouter {
  static var appRouter;

  static AppRouter instance() {
    appRouter ??= AppRouter();
    return appRouter;
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.gitUserScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GitUsersBloc(),
                  child: const GitUserPage(),
                ),
            settings: settings);
      case Constants.gitRepoScreen:
        String user = settings.arguments!.toString();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GitReposBloc(),
                  child: GitReposPage(user),
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GitUsersBloc(),
                  child: const GitUserPage(),
                ),
            settings: settings);
    }
  }
}
