import 'package:dio/dio.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserPagePresenter {
  Future<dynamic> getAllUserAPI() async {
      Response response = await ApiRepository.postAPI(ApiConst.allUsersAPI,{});
      return response;
  }
}