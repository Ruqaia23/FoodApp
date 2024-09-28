import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  String? sId;
  String? title;
  String? time;
  List<String>? foodTags;
  String? category;
  List<String>? foodType;
  String? code;
  bool? isAvailable;
  String? restaurant;
  double? rating;
  String? ratingCount;
  String? description;
  double? price;
  List<Additives>? additives;
  List<String>? imageUrl;
  int? iV;
  bool? promotion;
  int? promotionPrice;
  String? createdAt;
  String? updatedAt;
  bool? verified;

  FoodsModel(
      {this.sId,
      this.title,
      this.time,
      this.foodTags,
      this.category,
      this.foodType,
      this.code,
      this.isAvailable,
      this.restaurant,
      this.rating,
      this.ratingCount,
      this.description,
      this.price,
      this.additives,
      this.imageUrl,
      this.iV,
      this.promotion,
      this.promotionPrice,
      this.createdAt,
      this.updatedAt,
      this.verified});

  FoodsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    time = json['time'];
    foodTags = json['foodTags'].cast<String>();
    category = json['category'];
    foodType = json['foodType'].cast<String>();
    code = json['code'];
    isAvailable = json['isAvailable'];
    restaurant = json['restaurant'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    description = json['description'];
    price = json['price'];
    if (json['additives'] != null) {
      additives = <Additives>[];
      json['additives'].forEach((v) {
        additives!.add(new Additives.fromJson(v));
      });
    }
    imageUrl = json['imageUrl'].cast<String>();
    iV = json['__v'];
    promotion = json['promotion'];
    promotionPrice = json['promotionPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['time'] = this.time;
    data['foodTags'] = this.foodTags;
    data['category'] = this.category;
    data['foodType'] = this.foodType;
    data['code'] = this.code;
    data['isAvailable'] = this.isAvailable;
    data['restaurant'] = this.restaurant;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.additives != null) {
      data['additives'] = this.additives!.map((v) => v.toJson()).toList();
    }
    data['imageUrl'] = this.imageUrl;
    data['__v'] = this.iV;
    data['promotion'] = this.promotion;
    data['promotionPrice'] = this.promotionPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['verified'] = this.verified;
    return data;
  }
}

class Additives {
  int? id;
  String? title;
  String? price;

  Additives({this.id, this.title, this.price});

  Additives.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    return data;
  }
}
