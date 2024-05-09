class HomeModel {
  bool status;
  String message;
  HomeData result;

  HomeModel(this.status, this.message, this.result);

  factory HomeModel.fromJson(Map<dynamic, dynamic> json) {
    return HomeModel(
      json['status'],
      json['message'],
      HomeData.fromJson(json['result']),
    );
  }
}

class HomeData {
  String totalUser;
  String totalKey;
  String totalPlan;

  HomeData(this.totalUser, this.totalKey, this.totalPlan);

  factory HomeData.fromJson(Map<dynamic, dynamic> json) {
    return HomeData(
      json['totalUser'] ?? "",
      json['totalKey'] ?? "",
      json['totalPlan'] ?? "",
    );
  }
}



