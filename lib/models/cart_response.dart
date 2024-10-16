import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(
    json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson)));

class CartResponse {
  final String id;
  final ProductId productId;
  final List<String> additives;
  final num totalPrice;
  final int quantity;

  CartResponse({
    required this.id,
    required this.productId,
    required this.additives,
    required this.totalPrice,
    required this.quantity,
  });

  // Factory method to create CartResponse from JSON
  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      id: json['_id'] ?? "0",
      productId: ProductId.fromJson(json['productId']),
      additives: List<String>.from(json['additives']),
      totalPrice: json['totalPrice'],
      quantity: json['quantity'],
    );
  }

  // Method to convert CartResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'additives': additives,
      'totalPrice': totalPrice,
      'quantity': quantity,
    };
  }
}

class ProductId {
  final String id;
  final String title;
  final String restaurant;
  final num rating;
  final String ratingCount;
  final List<String> imageUrl;

  ProductId({
    required this.id,
    required this.title,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      id: json['_id'],
      title: json['title'] ?? "",
      restaurant: "",
      rating: json['rating']?.toDouble() ?? 0.0,
      ratingCount: json['ratingCount'] ?? "0.0",
      imageUrl: List<String>.from(json['imageUrl']),
    );
  }
}
