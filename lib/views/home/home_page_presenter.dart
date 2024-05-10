import '../../repository/ApiRepository.dart';
import '../../repository/api_const.dart';

class HomePagePresenter{
  Future<dynamic> getDashboardDetailAPI() async {
    var response =await ApiRepository.getAPI(ApiConst.getDashboardDetailAPI,{});
    return response;
  }
}