import 'dart:convert';
import 'dart:math';

import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserPagePresenter {
  Future <String > allUsersAPI(String accessToken) async {
    var response = await ApiRepository.getAPI(
      ApiConst.allUsersAPI

    );
    print("all user get api response -------->>>> $response");
    if (response.statusCode == 200) {
      print("all user get api response --------2>>>> $response");
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}


// import 'package:dio/dio.dart';
// import 'package:key_admin_panel/model/alluser_datamodel.dart';
// import 'package:key_admin_panel/repository/ApiRepository.dart';
// import 'package:key_admin_panel/repository/api_const.dart';

// class UserPagePresenter {
//   Future<List<AllUserDataModel>> getAPI() async {
//     try {
//       Response response = await ApiRepository.getAPI(ApiConst.allUsersAPI);
//       List<dynamic> postMaps = response.data;
//       return postMaps
//           .map((postMap) => AllUserDataModel.fromJson(postMap))
//           .toList();
//     } catch (ex) {
//       throw ex;
//     }
//   }
// }









// import 'dart:convert';

// import 'package:key_admin_panel/repository/ApiRepository.dart';
// import 'package:key_admin_panel/repository/api_const.dart';

// class UserPagePresenter {
//   Future<Map<String, dynamic>> allUsersAPI(String accessToken) async {
//     final response = await ApiRepository.getAPI(
//       ApiConst.allUsersAPI,
//       headers: {
//         'Authorization': 'Bearer $accessToken',
//       },
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }