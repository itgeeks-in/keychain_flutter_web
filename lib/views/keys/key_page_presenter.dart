import 'package:dio/dio.dart';
import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class KeyPagePresenter{
 Future<dynamic> getAllKeyAPI(offset,limit,search) async {
  var requestBody = {
   "searchterm": search,
   "offset": offset,
   "limit": limit
  };
 var response =await ApiRepository.postAPI(ApiConst.getAllKeysAPI, requestBody);
 return response;
 }

 Future<dynamic> keyEditAPI(String imageName,String description,String category,String id) async {

  var jsonFromData ;

   jsonFromData = FormData.fromMap(
       {
        ApiConst.description: description,
        ApiConst.imageName: imageName,
        ApiConst.categoryId: category,
        ApiConst.id: id,
       }
   );


  var response = await ApiRepository.putAPI(
      ApiConst.keyUpdateAPI, jsonFromData);
  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$response");
  return response;
 }






}