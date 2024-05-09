import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class KeyPagePresenter{
 Future<dynamic> getAllKeyAPI(offset,limit) async {
  var requestBody = {
   "offset": offset,
   "limit": limit
  };
 var response =await ApiRepository.getAPI(ApiConst.getAllKeysAPI, requestBody);
 return response;
 }
}