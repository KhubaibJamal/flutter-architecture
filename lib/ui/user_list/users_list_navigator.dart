import 'package:architecture/navigation/app_navigation.dart';
import 'package:architecture/ui/user_details/user_details_navigator.dart';
import 'package:architecture/ui/user_list/user_list_initial_params.dart';
import 'package:architecture/ui/user_list/user_list_page.dart';
import 'package:flutter/material.dart';

class UsersListNavigator with UserDetailsRoute {
  UsersListNavigator(this.appNavigation);
  @override
  late BuildContext context;

  @override
  final AppNavigation appNavigation;
}

mixin UsersListRoute {
  openUsersListPage(UserListInitialParams initialParams) {
    appNavigation.push(
      context,
      UserListPage(initialParams: initialParams),
    );
  }

  AppNavigation get appNavigation;

  BuildContext get context;
}
