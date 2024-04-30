import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class KeyPagePresenter{
 Future<dynamic> getAllKeyAPI() async {
 var response =await ApiRepository.getAPI(ApiConst.getAllKeysAPI);
 print("Response is here -------------------");
 return response;
 }
}