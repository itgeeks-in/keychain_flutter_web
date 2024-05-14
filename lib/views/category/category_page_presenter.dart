import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class CategoryPagePresenter{

  Future<dynamic> getAllCategoryAPI(query) async {
    final jsonFormData = {
      ApiConst.searchTerm : query,
    };
    var response =await ApiRepository.postAPI(ApiConst.getAllCategoryAPI,jsonFormData);
    print("== $response");
    return response;
  }
  
  Future<dynamic> addKeyCategory(String categoryName) async{
    final jsonFormData = {
      ApiConst.category : categoryName,
    };
    var response = await ApiRepository.postAPI(ApiConst.addKeyCategoryAPI, jsonFormData);
    print("== $response");
    return response;
  }


  Future<dynamic> editCategory(String categoryName,id) async{
    final jsonFormData = {
      ApiConst.category : categoryName,  ApiConst.id : id
    };
    var response = await ApiRepository.putAPI(ApiConst.updateCategoryAPI, jsonFormData);
    print(response);
    return response;
  }

  Future<dynamic> deleteCategory(String id) async{
    final jsonFormData = {
      ApiConst.id : id,
    };
    var response = await ApiRepository.deleteAPI(ApiConst.deleteCategory, data: jsonFormData);
    print("== $response");
    return response;
  }
}