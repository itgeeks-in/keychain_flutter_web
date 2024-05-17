import 'dart:io';
import 'package:dio/dio.dart';
import '../../repository/ApiRepository.dart';
import '../../repository/api_const.dart';


class ProfilePresenter{

  Future<dynamic> profileUpdateAPI(
      String firstName,String lastName, String email) async{
      final jsonFromData =
        {
          ApiConst.firstName : firstName,
          ApiConst.lastName : lastName,
          ApiConst.email : email,
        };
      var response = await ApiRepository.putAPI(
          ApiConst.updateUserAPI, jsonFromData);
      print(">>>>>>>>>>>>     "+response.toString());
      return response;
  }

  Future<dynamic> profileImageAPI(File file) async{
    print("> ????        ${file.uri.path}");
    String fileName = file.uri.path.split('/').last;

//       [MultipartFile.fromFile(file.uri.path, filename: fileName),],
    FormData jsonFromData = FormData.fromMap(
        {
          'profile' :   await  MultipartFile.fromString(file.uri.path, filename: fileName)
    });

    var response = await ApiRepository.putAPI(
        ApiConst.addProfileImgAPI, jsonFromData);

      print(">>>>>>>>>>>>     "+response.toString());
    return response;
  }
}