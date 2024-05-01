import 'package:dio/dio.dart';
import 'package:key_admin_panel/model/alluser_datamodel.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserPagePresenter {
  Future<dynamic> allUsersAPI() async {
    try {
      //print("object1");
      Response response = await ApiRepository.getAPI(ApiConst.allUsersAPI);
      //print("object2");

      if (response.data == null) {
        throw Exception("Response data is null");
      }

      Map<String, dynamic> responseData = response.data;

      if (responseData['result'] == null) {
        throw Exception("Result data is null");
      }

      List<dynamic> usersData = responseData['result'];
      // print("--------------<><><><>---------");

      return usersData;
    } catch (ex) {
      print("object5");

      throw ex;
    }
  }
}
