class AllUserDataModel {
  bool? status;
  String? message;
  List<Result>? result;

  AllUserDataModel({this.status, this.message, this.result});

  AllUserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? totalkey;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? salt;
  String? hash;
  bool? isAgreed;
  bool? isAdmin;
  List<Keys>? keys;
  int? iV;
  String? profileImage;
  String? plan;
  int? keyAdded;

  Result(
      {this.totalkey,
      this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.salt,
      this.hash,
      this.isAgreed,
      this.isAdmin,
      this.keys,
      this.iV,
      this.profileImage,
      this.plan,
      this.keyAdded});

  Result.fromJson(Map<String, dynamic> json) {
    totalkey = json['totalkey'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    salt = json['salt'];
    hash = json['hash'];
    isAgreed = json['isAgreed'];
    isAdmin = json['isAdmin'];
    if (json['keys'] != null) {
      keys = <Keys>[];
      json['keys'].forEach((v) {
        keys!.add(new Keys.fromJson(v));
      });
    }
    iV = json['__v'];
    profileImage = json['profileImage'];
    plan = json['plan'];
    keyAdded = json['keyAdded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalkey'] = this.totalkey;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['salt'] = this.salt;
    data['hash'] = this.hash;
    data['isAgreed'] = this.isAgreed;
    data['isAdmin'] = this.isAdmin;
    if (this.keys != null) {
      data['keys'] = this.keys!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['profileImage'] = this.profileImage;
    data['plan'] = this.plan;
    data['keyAdded'] = this.keyAdded;
    return data;
  }
}

class Keys {
  String? imageName;
  String? imagePath;
  String? backImagePath;
  String? edgedImagePath;
  String? lockImagePath;
  String? description;
  int? edges;
  String? sId;
  String? categoryName;
  String? categoryId;

  Keys(
      {this.imageName,
      this.imagePath,
      this.backImagePath,
      this.edgedImagePath,
      this.lockImagePath,
      this.description,
      this.edges,
      this.sId,
      this.categoryName,
      this.categoryId});

  Keys.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
    imagePath = json['imagePath'];
    backImagePath = json['backImagePath'];
    edgedImagePath = json['edgedImagePath'];
    lockImagePath = json['lockImagePath'];
    description = json['description'];
    edges = json['edges'];
    sId = json['_id'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageName'] = this.imageName;
    data['imagePath'] = this.imagePath;
    data['backImagePath'] = this.backImagePath;
    data['edgedImagePath'] = this.edgedImagePath;
    data['lockImagePath'] = this.lockImagePath;
    data['description'] = this.description;
    data['edges'] = this.edges;
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
