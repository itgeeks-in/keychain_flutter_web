
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

  Future<dynamic> profileImageAPI(String file) async{

    String fileName = file.split('/').last;

//       [MultipartFile.fromFile(file.uri.path, filename: fileName),],

print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n$file >>>>>>>>>>>");

    FormData jsonFromData = FormData.fromMap(
        {
          'profile' :   MultipartFile.fromString(file, filename: fileName)
    });

    var response = await ApiRepository.putAPI(
        ApiConst.addProfileImgAPI, jsonFromData);

      print(">>>>>>>>>>>>     "+response.toString());
    return response;
  }
}