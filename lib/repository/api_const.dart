class ApiConst {
  // // FIXME common base url to change // //
  static const String mainUrl = 'http://144.126.248.21';
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
  static const String getAllCategoryAPI = '/key/getkeycategory';
  static const String addKeyCategoryAPI = '/key/addkeycategory';
  static const String getDashboardDetailAPI = '/admin/dashboard';
  static const String getAllUserPlanDetail = '/admin/user-plan';


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
  static const String categoryName = "category";
  static const String offset= "offset";
  static const String limit = "limit";

}
