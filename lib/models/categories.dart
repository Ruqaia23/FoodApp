import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  String? id;
  String? title;
  String? value;
  String? imageUrl;

  CategoriesModel({this.id, this.title, this.value, this.imageUrl});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    value = json['value'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['title'] = this.title;
    data['value'] = this.value;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
