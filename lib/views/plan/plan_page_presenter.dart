import '../../repository/ApiRepository.dart';
import '../../repository/api_const.dart';

class PlanPagePresenter{
  Future<dynamic> getAllUserPlanDetail() async {
    var response = await ApiRepository.getAPI(ApiConst.getAllUserPlanDetail, '');
    return response;
  }
  Future<dynamic> getAllPlan() async {
    var response = await ApiRepository.getAPI(ApiConst.getAllPlans,'');
    return response;
  }

}