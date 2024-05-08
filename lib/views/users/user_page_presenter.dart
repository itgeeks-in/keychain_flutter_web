import 'package:dio/dio.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserPagePresenter {
  Future<dynamic> allUsersAPI() async {
      Response response = await ApiRepository.getAPI(ApiConst.allUsersAPI);
      return response;
  }
}






// Future<dynamic> allUsersAPI() async {
//   try {
//     Response response = await ApiRepository.getAPI(ApiConst.allUsersAPI);
//
//     if (response.data == null) {
//       throw Exception("Response data is null");
//     }
//
//     Map<String, dynamic> responseData = response.data;
//
//     if (responseData['result'] == null) {
//       throw Exception("Result data is null");
//     }
//
//     List<dynamic> usersData = responseData['result'];
//
//     return usersData;
//   } catch (ex) {
//     print("object5");
//
//     throw ex;
//   }
// }