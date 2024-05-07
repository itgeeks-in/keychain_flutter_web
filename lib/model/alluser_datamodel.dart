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
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  List<String>? keysId;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? salt;
  String? hash;
  bool? isAgreed;
  bool? isAdmin;
  List<Key>? keys;
  int? totalkey;
  String? resetLink;
  int? iV;
  String? profileImage;

  Result({
    this.keysId,
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.salt,
    this.hash,
    this.isAgreed,
    this.isAdmin,
    this.keys,
    this.totalkey,
    this.resetLink,
    this.iV,
    this.profileImage,
  });

  Result.fromJson(Map<String, dynamic> json) {
    keysId = json['keysId'].cast<String>();
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    salt = json['salt'];
    hash = json['hash'];
    isAgreed = json['isAgreed'];
    isAdmin = json['isAdmin'];
    if (json['keys'] != null) {
      keys = <Key>[];
      json['keys'].forEach((v) {
        keys!.add(Key.fromJson(v));
      });
    }
    totalkey = json['totalkey'];
    resetLink = json['resetLink'];
    iV = json['__v'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keysId'] = keysId;
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['salt'] = salt;
    data['hash'] = hash;
    data['isAgreed'] = isAgreed;
    data['isAdmin'] = isAdmin;
    if (keys != null) {
      data['keys'] = keys!.map((v) => v.toJson()).toList();
    }
    data['totalkey'] = totalkey;
    data['resetLink'] = resetLink;
    data['__v'] = iV;
    data['profileImage'] = profileImage;
    return data;
  }
}

class Key {
  String? keyId;
  String? keyName;

  Key({this.keyId, this.keyName});

  Key.fromJson(Map<String, dynamic> json) {
    keyId = json['keyId'];
    keyName = json['keyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keyId'] = keyId;
    data['keyName'] = keyName;
    return data;
  }
}
