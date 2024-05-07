import 'package:key_admin_panel/repository/ApiRepository.dart';
import 'package:key_admin_panel/repository/api_const.dart';

class UserAddPresenter {
  Future<dynamic> signupAPI(
      String firstName,
      String lastName,
      String email,
      String confirmEmail,
      String password,
      String confirmPassword,
      bool isAgreed) async {
    final jsonFromData = {
      ApiConst.firstName: firstName,
      ApiConst.lastName: lastName,
      ApiConst.email: email,
      ApiConst.confirmEmail: email,
      ApiConst.password: password,
      ApiConst.confirmPassword: confirmPassword,
      ApiConst.isAgreed: isAgreed,
    };
    var response =
        await ApiRepository.postAPI(ApiConst.signupAPI, jsonFromData);

    return response;
  }
}
