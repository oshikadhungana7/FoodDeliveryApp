
import 'dart:io';

import '../data_source/Remote_Data_source/user_data_source.dart';
import '../data_source/local_data_source/user_data_source.dart';
import '../model/user.dart';


abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser( File? file,User user);
  Future<bool> loginUser(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(File? file ,User user) {
    return UserRemoteDataSource().addUser(file, user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getAllUser();
  }

  @override
  Future<bool> loginUser(String email, String password) {
    return UserRemoteDataSource().loginUser(email, password);
  }

  
}
