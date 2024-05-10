class HomeModel {
  bool status;
  String message;
  HomeData result;

  HomeModel(this.status, this.message, this.result);

  factory HomeModel.fromJson(Map<dynamic, dynamic> json) {
    return HomeModel(
        json['status'], json['message'], new HomeData.fromJson(json['result']));
  }
}

class HomeData {
  int totalUser;
  int totalKey;
  int totalPlan;

  HomeData(this.totalUser, this.totalKey, this.totalPlan);

  factory HomeData.fromJson(Map<dynamic, dynamic> json) {
    return HomeData(
      json['totalUser'] ?? 0,
      json['totalKey'] ?? 0,
      json['totalPlan'] ?? 0,
    );
  }
}
