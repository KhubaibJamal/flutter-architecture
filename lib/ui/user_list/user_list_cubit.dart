import 'package:architecture/domain/repositories/user_repository.dart';
import 'package:architecture/ui/user_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UsersListState> {
  final UserRepository userRepository;
  UserListCubit(this.userRepository) : super(UsersListState.empty());

  Future<void> fetchUser() async {
    emit(state.copyWith(isLoading: true));
    try {
      final users = await userRepository.getUsers();
      emit(state.copyWith(users: users, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: "Failed to fetch users", isLoading: false));
    }
  }
}
