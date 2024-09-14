import 'package:architecture/data/rest_api_user_repository.dart';
import 'package:architecture/domain/repositories/user_repository.dart';
import 'package:architecture/ui/user_details/user_details_cubit.dart';
import 'package:architecture/ui/user_list/user_list_cubit.dart';
import 'package:architecture/ui/user_list/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<UserRepository>(RestApiUserRepository());
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UserListCubit(getIt())..fetchUser()),
      BlocProvider(create: (context) => UserDetailsCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListPage(),
    );
  }
}

