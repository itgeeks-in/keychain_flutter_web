import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class KeyPagePresenter{
 Future<dynamic> getAllKeyAPI() async {
 var response =await ApiRepository.getApiForPagination(ApiConst.getAllKeysAPI,"0",2);
 return response;
 }
}