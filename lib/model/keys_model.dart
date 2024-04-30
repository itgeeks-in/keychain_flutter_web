class KeysModel {
  bool status;
  String message;
  List<KeysData> result;

  KeysModel(this.status, this.message, this.result);

  factory KeysModel.fromJson(Map<dynamic, dynamic> json) {
    return KeysModel(json['status'], json['message'],
        List<KeysData>.from(
            json["result"].map((x) => KeysData.fromJson(x))));
  }
}

class KeysData {
  String imagePath;
  String backImagePath;
  String lockImagePath;
  String edgedImagePath;
  String imageName;
  String randomImageName;
  String description;
  String id;


  KeysData(this.imagePath,this.backImagePath,this.edgedImagePath,this.lockImagePath,this.imageName,this.randomImageName,this.description,this.id);

  factory KeysData.fromJson(Map<dynamic, dynamic> json) {
    return KeysData(
        json['imagePath'] ?? "",
        json['backImagePath'] ?? "",
        json['edgedImagePath'] ?? "",
        json['lockImagePath'] ?? "",
        json['imageName'] ?? "",
        json['randomImageName'] ?? "",
        json['description'] ?? "",
        json['_id'] ?? ""

    );
  }
}




