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
}