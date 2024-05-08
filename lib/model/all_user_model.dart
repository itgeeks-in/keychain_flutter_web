class AllUserModel {
  bool status;
  String message;
  List<UserData> result;

  AllUserModel(this.status, this.message, this.result);

  factory AllUserModel.fromJson(Map<dynamic, dynamic> json) {
    return AllUserModel(json['status'], json['message'],
        List<UserData>.from(
            json["result"].map((x) => UserData.fromJson(x))));
  }
}

class UserData {
  String id;
  String firstName;
  String lastName;
  String email;
  String salt;
  String hash;
  bool isAgreed;
  bool isAdmin;
  String totalKey;
  String resetLink;
  List<dynamic> keys;
  String createdAt;
  String updatedAt;
  int __v;


  UserData(this.id,this.firstName,this.lastName,this.email,this.salt,this.hash,this.isAgreed,this.isAdmin,this.totalKey,this.resetLink,this.keys,this.createdAt,this.updatedAt,this.__v);

  factory UserData.fromJson(Map<dynamic, dynamic> json) {
    return UserData(
        json['_id'] ?? "",
        json['firstName'] ?? "",
        json['lastName'] ?? "",
        json['email'] ?? "",
        json['salt'] ?? "",
        json['hash'] ?? "",
        json['isAgreed'] ?? false,
        json['isAdmin'] ?? false,
        json['totalkey'].toString() ?? "",
        json['resetLink'] ?? "",
        json['keysId'] ?? [],
        json['createdAt'] ?? "",
        json['updatedAt'] ?? "",
        json['__v'] ?? 0,
    );
  }
}
