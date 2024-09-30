import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String? sId;
  final String? title;
  final String? time;
  final List<String>? foodTags;
  final String? category;
  final List<String>? foodType;
  final String? code;
  final bool? isAvailable;
  final String? restaurant;
  final num? rating;
  final int? ratingCount; // Changed to int for consistency
  final String? description;
  final num? price;
  final List<Additives>? additives;
  final List<String>? imageUrl;
  final int? iV;
  final bool? promotion;
  final int? promotionPrice;
  final String? createdAt;
  final String? updatedAt;
  final bool? verified;

  FoodsModel({
    required this.sId,
    required this.title,
    required this.time,
    this.foodTags,
    required this.category,
    this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    this.additives,
    required this.imageUrl,
    required this.iV,
    required this.promotion,
    required this.promotionPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.verified,
  });

  // Refactored fromJson method with proper null checks and casting
  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      sId: json['_id'] as String?,
      title: json['title'] as String?,
      time: json['time'] as String?,
      foodTags:
          (json['foodTags'] as List<dynamic>?)?.cast<String>(), // Safe casting
      category: json['category'] as String?,
      foodType:
          (json['foodType'] as List<dynamic>?)?.cast<String>(), // Safe casting
      code: json['code'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      restaurant: json['restaurant'] as String?,
      rating: json['rating'] as num?,
      ratingCount: int.tryParse(
          json['ratingCount'].toString()), // Ensuring proper type conversion
      description: json['description'] as String?,
      price: json['price'] as num?,
      additives: (json['additives'] as List<dynamic>?)
          ?.map((item) => Additives.fromJson(item as Map<String, dynamic>))
          .toList(),
      imageUrl:
          (json['imageUrl'] as List<dynamic>?)?.cast<String>(), // Safe casting
      iV: json['__v'] as int?,
      promotion: json['promotion'] as bool?,
      promotionPrice: json['promotionPrice'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      verified: json['verified'] as bool?,
    );
  }

  // toJson method with null safety checks
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['time'] = time;
    data['foodTags'] = foodTags;
    data['category'] = category;
    data['foodType'] = foodType;
    data['code'] = code;
    data['isAvailable'] = isAvailable;
    data['restaurant'] = restaurant;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    data['description'] = description;
    data['price'] = price;
    if (additives != null) {
      data['additives'] = additives!.map((v) => v.toJson()).toList();
    }
    data['imageUrl'] = imageUrl;
    data['__v'] = iV;
    data['promotion'] = promotion;
    data['promotionPrice'] = promotionPrice;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['verified'] = verified;
    return data;
  }
}

class Additives {
  int? id;
  String? title;
  String? price;

  Additives({this.id, this.title, this.price});

  factory Additives.fromJson(Map<String, dynamic> json) {
    return Additives(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    return data;
  }
}
