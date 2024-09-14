import 'package:architecture/domain/entities/user.dart';

class UsersListState {
  final List<User> users;
  final bool isLoading;
  final String? error;
  const UsersListState({
    required this.users,
    required this.isLoading,
    required this.error,
  });

  factory UsersListState.initial() => const UsersListState(
        users: [],
        isLoading: false,
        error: '',
      );

  UsersListState copyWith({
    List<User>? users,
    bool? isLoading,
    String? error,
  }) =>
      UsersListState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
