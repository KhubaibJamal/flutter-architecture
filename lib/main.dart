import 'package:architecture/user_list_cubit.dart';
import 'package:architecture/user_list_page.dart';
import 'package:architecture/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<UserRepository>(UserRepository());
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UserListCubit(getIt())..fetchUser()),
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
