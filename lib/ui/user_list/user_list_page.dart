import 'package:architecture/ui/user_list/user_list_cubit.dart';
import 'package:architecture/ui/user_list/user_list_initial_params.dart';
import 'package:architecture/ui/user_list/users_list_state.dart';
import 'package:architecture/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  final UserListInitialParams initialParams;
  const UserListPage({super.key, required this.initialParams});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late UserListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UserListCubit>(context);
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            final userState = state as UsersListState;

            if (userState.error == null) {
              return Center(child: Text(userState.error!));
            } else {
              return userState.isLoading
                  ? const CircularProgressIndicator()
                  : ListView(
                      children: userState.users
                          .map(
                            (user) => UserCard(
                              user: user,
                              onTap: () => cubit.onUserTap(user),
                            ),
                          )
                          .toList(),
                    );
            }
          },
        ),
      ),
    );
  }
}
