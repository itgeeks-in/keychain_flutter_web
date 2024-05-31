import 'package:dio/dio.dart';

import '../../repository/ApiRepository.dart';
import '../../repository/api_const.dart';

class PlanPagePresenter{
  Future<dynamic> getAllUserPlanDetail(offset, limit, search) async {
    var requestBody = {"searchterm": search, "offset": offset, "limit": limit};
    Response response =
    await ApiRepository.postAPI(ApiConst.allUsersAPI, requestBody);
    return response;
  }

  Future<dynamic> getAllPlan() async {
    var response = await ApiRepository.getAPI(ApiConst.getAllPlans,'');
    return response;
  }

  Future<dynamic> editPlan(String id,String planName,price) async{
    final jsonFormData = {
      ApiConst.id : id,  ApiConst.planName : planName , ApiConst.price : price
    };
    var response = await ApiRepository.putAPI(ApiConst.updatePlan, jsonFormData);
    print(response);
    return response;
  }

  Future<dynamic> deletePlan(String id) async{
    final jsonFormData = {
      ApiConst.id : id,
    };
    var response = await ApiRepository.deleteAPI(ApiConst.deletePlan, data: jsonFormData);
    print("== $response");
    return response;
  }

}