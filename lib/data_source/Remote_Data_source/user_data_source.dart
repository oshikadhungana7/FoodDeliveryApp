
import 'dart:io';

import '../../app/constants.dart';
import '../../helper/http_service.dart';
import '../../model/user.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import 'Response/Login_response.dart';

class UserRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();


  Future<int> addUser(File? file , User user) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        );
      }

      FormData formData = FormData.fromMap({
        'fname': user.fname,
        'lname': user.lname,
        'email': user.email,
        'password': user.password,
       
        'image': image,
      });

      Response response = await _httpServices.post(
        Constant.userRegisterURL,
        data: formData,
    
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      Response response = await _httpServices.post(
        Constant.userLoginURL,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Constant.token = "Bearer ${loginResponse.token!}";
        return true;
      } else {
        return false;
      }
     }
     catch (e) {
      return false;
    }
 }
}