class CategoryModel {
  bool status;
  String message;
  List<CategoryData> result;

  CategoryModel(this.status, this.message, this.result);

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(json['status'], json['message'],
        List<CategoryData>.from(
            json["result"].map((x) => CategoryData.fromJson(x))));
  }
}

class CategoryData {
  String categoryId;
  String categoryName;
  String v;


  CategoryData(this.categoryId,this.categoryName,this.v);

  factory CategoryData.fromJson(Map<dynamic, dynamic> json) {
    return CategoryData(
        json['_id'] ?? "",
        json['category'] ?? "",
        json['--V'] ?? ""
    );
  }
}




