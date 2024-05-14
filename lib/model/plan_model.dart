class PlanModel{
  bool status;
  String message;
  List<PlanDetail> result;

  PlanModel(this.status, this.message, this.result);

  factory PlanModel.fromJson(Map<dynamic, dynamic> json) {
    return PlanModel(json['status'], json['message'],
        List<PlanDetail>.from(
            json["result"].map((x) => PlanDetail.fromJson(x))));
  }
}
class PlanDetail{
  String id;
  String planName;
  String price;
  String keyCount;
  String createdAt;
  String updateAt;
  int __v;

  PlanDetail(this.id, this.planName, this.price, this.keyCount,this.createdAt,this.updateAt,this.__v);

  factory PlanDetail.fromJson(Map<String, dynamic> json) {
    return PlanDetail(
        json['_id'] ?? "",
        json['planName'] ?? "",
        json['price'] ?? "",
        json['keyCount'] ?? "",
        json['createdAt'] ?? "",
        json['updatedAt'] ?? "",
        json['__v'] ?? 0
    );
  }
}