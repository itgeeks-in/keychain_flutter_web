import '../../repository/ApiRepository.dart';
import '../../repository/api_const.dart';

class PlanPagePresener{
  Future<dynamic> getAllUserPlanDetail() async {
    var response =await ApiRepository.getAPI(ApiConst.getAllUserPlanDetail, '');
    return response;
  }
}