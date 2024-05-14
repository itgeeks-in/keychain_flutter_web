import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class CategoryPagePresenter{
  Future<dynamic> getAllCategoryAPI(query) async {
    final jsonFormData = {
      ApiConst.searchTerm : query,
    };
    var response =await ApiRepository.postAPI(ApiConst.getAllCategoryAPI,jsonFormData);
    return response;
  }
  
  Future<dynamic> addKeyCategory(String categoryName) async{
    final jsonFormData = {
      ApiConst.categoryName : categoryName,
    };
    var response = await ApiRepository.postAPI(ApiConst.addKeyCategoryAPI, jsonFormData);
    return response;
  }
}