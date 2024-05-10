import 'package:dio/dio.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

import '../../utils/session.dart';

class KeyPagePresenter{
 Future<dynamic> getAllKeyAPI(String offset,int limit) async {

  var requestBody = {
   "offset": "$offset",
   "limit": limit
  };
  var response =await ApiRepository.getAPI(ApiConst.getAllKeysAPI, requestBody);

/*  String token = await Session().getToken();
   Dio client = Dio();*/
  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
 /* final response = await client.request(
   'http://144.126.248.21/key/getkeys',
   data: {"saloni":"dfgd"},
   options: Options(method: 'GET',headers: {"authorization":"Bearer " + token}),
  );
  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$response");*/
/*  var response2 = await ApiRepository.getAPI(
      "/key/getkeys","saloni");
  print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>   ....   $response2");*/

 return response;
 }
}