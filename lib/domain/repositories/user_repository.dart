import 'package:architecture/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
