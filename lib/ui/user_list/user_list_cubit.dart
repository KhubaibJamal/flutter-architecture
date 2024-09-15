import 'package:architecture/domain/entities/user.dart';
import 'package:architecture/domain/repositories/user_repository.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/user_list/users_list_navigator.dart';
import 'package:architecture/ui/user_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UsersListState> {
  final UserRepository userRepository;
  final UsersListNavigator navigator;
  UserListCubit(
    this.userRepository,
    this.navigator,
  ) : super(UsersListState.initial());

  Future<void> fetchUser() async {
    emit(state.copyWith(isLoading: true));
    try {
      final users = await userRepository.getUsers();
      emit(state.copyWith(users: users, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: "Failed to fetch users", isLoading: false));
    }
  }

  onUserTap(User user) =>
      navigator.openUserDetails(UserDetailsInitialParam(user: user));
}
