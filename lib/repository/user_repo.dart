import '../data_source/local_data_source/user_data_source.dart';
import '../model/user.dart';


abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser(User user);
  Future<User?> loginUser(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserDataSource().addUser(user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getAllUser();
  }

  @override
  Future<User?> loginUser(String email, String password) {
    return UserDataSource().loginUser(email, password);
  }
}
