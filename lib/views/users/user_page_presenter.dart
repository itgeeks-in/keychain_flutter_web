// import 'dart:convert';
// // import 'dart:math';

// import 'package:key_admin_panel/repository/ApiRepository.dart';
// import 'package:key_admin_panel/repository/api_const.dart';

// class UserPagePresenter {
//   Future<Map<String, dynamic>> allUsersAPI() async {
//     var response = await ApiRepository.getAPI(
//       ApiConst.allUsersAPI,
//     );
//     print("all user get api response -------->>>> $response");
//     if (response.statusCode == 200) {
//       print("fdsjfsjdsf");
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:key_admin_panel/model/alluser_datamodel.dart';
// import 'package:key_admin_panel/repository/ApiRepository.dart';
// import 'package:key_admin_panel/repository/api_const.dart';

// class UserPagePresenter {
//   Future<List<AllUserDataModel>> allUsersAPI() async {
//     try {
//       print("object1");
//       Response response = await ApiRepository.getAPI(ApiConst.allUsersAPI);
//       print("object2");
//       if (response.data == null) {
//         throw Exception("Response data is null");
//       }
//       print("object3");
//       Map<String, dynamic> responseData = response.data;
//       if (responseData['result'] == null) {
//         throw Exception("Result data is null");
//       }

//       List<dynamic> usersData = responseData['result'];
//       print("object4 $usersData");
//       return usersData
//           .map((userData) => AllUserDataModel.fromJson(userData))
//           .toList();
//       // print(usersData);
//     } catch (ex) {
//       print("object5");
//       throw ex;
//     }
//   }
// }

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
      // print(usersData);
      // print("-------------<><><><><>----------");
      return usersData;
      // return usersData
      //     .map((userData) =>
      //         AllUserDataModel.fromJson(userData as Map<String, dynamic>))
      //     .toList();
    } catch (ex) {
      print("object5");

      throw ex;
    }
  }
}
