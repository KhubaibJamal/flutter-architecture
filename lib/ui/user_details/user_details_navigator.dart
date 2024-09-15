import 'package:architecture/navigation/app_navigation.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/user_details/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParam initialParams) {
    appNavigation.push(
      context,
      UserDetailsPage(initialParams: initialParams),
    );
  }

  AppNavigation get appNavigation;

  BuildContext get context;
}
