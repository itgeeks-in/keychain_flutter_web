class UserDataModel {
  bool status;
  String message;
  SignupResultData result;

  UserDataModel(this.status, this.message, this.result);

  factory UserDataModel.fromJson(Map<dynamic, dynamic> json) {
    return UserDataModel(
      json['status'],
      json['message'],
      SignupResultData.fromJson(json['result']),
    );
  }
}

class SignupResultData {
  String firstName;
  String lastName;
  String email;
  String salt;
  String hash;
  bool isAgreed;
  bool isAdmin;
  String token;
  String id;
  String profileImage;
  String totalKey;
  String resetLink;
  String createdAt;
  String updatedAt;
  String plan;
  List<dynamic> keys;
  int v;

  SignupResultData(this.firstName, this.lastName, this.email, this.salt,
      this.hash, this.isAgreed, this.isAdmin, this.keys, this.token, this.v,
      this.id, this.profileImage, this.totalKey, this.resetLink,this.createdAt,this.updatedAt,this.plan);

  factory SignupResultData.fromJson(Map<dynamic, dynamic> json) {
    return SignupResultData(
      json['firstName'] ?? "",
      json['lastName'] ?? "",
      json['email'] ?? "",
      json['salt'] ?? "",
      json['hash'] ?? "",
      json['isAgreed'] ?? false,
      json['isAdmin'] ?? false,
      json['keys'] ?? [],
      json['token'] ?? "",
      json['__v'] ?? 0,
      json['_id'] ?? "",
      json['profileImage'] ?? "",
      json['totalkey'] ?? "",
      json['resetLink'] ?? "",
      json['createdAt'] ?? "",
      json['updatedAt'] ?? "",
      json['plan'] ?? "",
    );
  }
}
