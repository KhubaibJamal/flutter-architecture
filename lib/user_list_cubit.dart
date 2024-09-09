import 'package:architecture/user_repository.dart';
import 'package:architecture/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UsersListState> {
  final UserRepository userRepository;
  UserListCubit(this.userRepository) : super(UsersListState.empty());

  Future<void> fetchUser() async {
    emit(state.copyWith(isLoading: true));
    final users = await userRepository.getUsers();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
