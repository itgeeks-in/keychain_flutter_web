class AddUser {
  bool? status;
  String? message;
  Result? result;

  AddUser({
    this.status,
    this.message,
    this.result,
  });
}

class Result {
  String? firstName;
  String? lastName;
  String? email;
  String? salt;
  String? hash;
  bool? isAgreed;
  bool? isAdmin;
  List<dynamic>? keysId;
  int? totalkey;
  String? resetLink;
  String? id;
  int? v;
  String? token;

  Result({
    this.firstName,
    this.lastName,
    this.email,
    this.salt,
    this.hash,
    this.isAgreed,
    this.isAdmin,
    this.keysId,
    this.totalkey,
    this.resetLink,
    this.id,
    this.v,
    this.token,
  });
}
