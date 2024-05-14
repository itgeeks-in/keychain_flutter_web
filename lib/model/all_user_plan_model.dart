class AllUserPlanModel {
  bool status;
  String message;
  List<UserDataPlan> result;

  AllUserPlanModel(this.status, this.message, this.result);

  factory AllUserPlanModel.fromJson(Map<dynamic, dynamic> json) {
    return AllUserPlanModel(json['status'], json['message'],
        List<UserDataPlan>.from(
            json["result"].map((x) => UserDataPlan.fromJson(x))));
  }
}

class UserDataPlan {
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
  String profileImage;
  Plan plan;


  UserDataPlan(this.id,this.firstName,this.lastName,this.email,this.salt,this.hash,this.isAgreed,this.isAdmin,this.totalKey,this.resetLink,this.keys,this.createdAt,this.updatedAt,this.__v,this.profileImage,this.plan);

  factory UserDataPlan.fromJson(Map<dynamic, dynamic> json) {
    return UserDataPlan(
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
        json['profileImage'] ?? "",
      Plan.fromJson(json['plan'] ?? {}),
    );
  }
}
class Plan {
  String id;
  String planName;
  String price;
  String keyCount;
  String createdAt;
  String updateAt;

  Plan(this.id, this.planName, this.price, this.keyCount,this.createdAt,this.updateAt);

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      json['_id'] ?? "",
      json['planName'] ?? "",
      json['price'] ?? "",
      json['keyCount'] ?? "",
      json['createdAt'] ?? "",
      json['updatedAt'] ?? ""
    );
  }
}
