import 'package:architecture/user_list_cubit.dart';
import 'package:architecture/users_list_state.dart';
import 'package:architecture/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UserListCubit>(context),
          builder: (context, state) {
            final userState = state as UsersListState;
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: userState.users
                        .map((user) => UserCard(user: user))
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
