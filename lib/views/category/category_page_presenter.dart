import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class CategoryPagePresenter{
  Future<dynamic> getAllCategoryAPI() async {
    var response =await ApiRepository.getAPI(ApiConst.getAllCategoryAPI);
    return response;
  }
}