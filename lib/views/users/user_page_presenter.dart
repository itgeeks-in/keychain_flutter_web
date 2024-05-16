import 'package:dio/dio.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserPagePresenter {
  Future<dynamic> getAllUserAPI(offset,limit,search) async {

    var requestBody = {
      "searchterm": search,
      "offset": offset,
      "limit": limit
    };
      Response response = await ApiRepository.postAPI(ApiConst.allUsersAPI,requestBody);
      return response;
  }
  Future<dynamic> editUserDetailAPI(String id,String firstName,String lastName,String email) async{
    final jsonFormData = {
      ApiConst.id : id, ApiConst.firstName:firstName,  ApiConst.lastName : lastName , ApiConst.email : email
    };
    var response = await ApiRepository.putAPI(ApiConst.updateUserAPI, jsonFormData);
    print(response);
    return response;
  }
}