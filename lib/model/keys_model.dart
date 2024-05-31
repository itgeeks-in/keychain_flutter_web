class KeysModel {
  bool status;
  String message;
  List<KeysData> result;

  KeysModel(this.status, this.message, this.result);

  factory KeysModel.fromJson(Map<dynamic, dynamic> json) {
    return KeysModel(json['status'], json['message'],
        List<KeysData>.from(json["result"].map((x) => KeysData.fromJson(x))));
  }
}

class KeysData {
  String imagePath;
  String imageName;
  String backImagePath;
  String lockImagePath;
  String backgroundLessImage;
  String backBackgroundLess;
  String description;
  String id;
  String categoryName;
  String categoryId;
  String createdAt;
  String updatedAt;
  String userId;
  int edges;
  int backEdges;
  int __v;

  KeysData(
    this.imagePath,
    this.imageName,
    this.backImagePath,
    this.lockImagePath,
    this.backgroundLessImage,
    this.backBackgroundLess,
    this.description,
    this.id,
    this.categoryName,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.edges,
    this.backEdges,
    this.__v
  );

  factory KeysData.fromJson(Map<dynamic, dynamic> json) {
    return KeysData(
      json['imagePath'] ?? "",
      json['imageName'] ?? "",
      json['backImagePath'] ?? "",
      json['lockImagePath'] ?? "",
      json['backgroundLessImage'] ?? "",
      json['backBackgroundLess'] ?? "",
      json['description'] ?? "",
      json['_id'] ?? "",
      json['categoryName'] ?? "",
      json['categoryId'] ?? "",
      json['createdAt'] ?? "",
      json['updatedAt'] ?? "",
      json['userId'] ?? "",
      json['edges'] ?? 0,
      json['backEdges'] ?? 0,
      json['__v'] ?? 0,
    );
  }
}
