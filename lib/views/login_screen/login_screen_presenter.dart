import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class LoginScreenPresenter {
  Future<dynamic>loginAPI(String email, String password) async{
  final jsonFormData = {
    ApiConst.email : email,
    ApiConst.password : password,
    };
   var response = await ApiRepository.postAPI(ApiConst.loginAPI, jsonFormData);

   return response;

  }
}