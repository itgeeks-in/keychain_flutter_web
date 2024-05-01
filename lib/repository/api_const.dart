class ApiConst {
  // // FIXME common base url to change // //
  static const String mainUrl = 'http://167.71.172.213';
  static const String appName = 'KEYPIT';
  static const String comparePercentage = "90";
  static const String imagePath = "$mainUrl/images/image/{user_id}/{image_id}";

  // TODO :   APIs
  static const String compareAPI = '/key/compare';
  static const String addkeyAPI = '/key/addkey';
  static const String getKeyByUserAPI = '/key/getuserkeys';
  static const String singleKeyByIdAPI = '/key/getkey';
  static const String signupAPI = '/auth/signup';
  static const String loginAPI = '/auth/login';
  static const String allUsersAPI = "/auth/getallusers";
  static const String getAllKeysAPI = '/key/getKeys';


  //TODO : Api parameter for calling (fields or param)
  static const String email = 'email';
  static const String file = 'file';
  static const String percentage = 'percentage';
  static const String description = 'description';
  static const String imageName = 'imageName';
  static const String id = 'id';

  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String mobile = 'mobile';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String confirmEmail = "confirmEmail";
  static const String isAgreed = "isAgreed";
}
