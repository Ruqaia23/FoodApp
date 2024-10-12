import 'dart:convert';

List<RestaurantModel> restaurantModelFromJson(String str) =>
    List<RestaurantModel>.from(
        json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  String? sId;
  String? title;
  String? time;
  String? imageUrl;
  String? owner;
  String? code;
  bool? isAvailable;
  bool? pickup;
  bool? delivery;
  List<Food>? foods; // Changed from List<Null> to List<Food>
  String? logoUrl;
  num? rating;
  String? ratingCount;
  String? verification;
  String? verificationMessage;
  Coords? coords;

  RestaurantModel(
      {this.sId,
      this.title,
      this.time,
      this.imageUrl,
      this.owner,
      this.code,
      this.isAvailable,
      this.pickup,
      this.delivery,
      this.foods,
      this.logoUrl,
      this.rating,
      this.ratingCount,
      this.verification,
      this.verificationMessage,
      this.coords});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    owner = json['owner'];
    code = json['code'];
    isAvailable = json['isAvailable'];
    pickup = json['pickup'];
    delivery = json['delivery'];
    if (json['foods'] != null) {
      foods = List<Food>.from(json['foods']
          .map((v) => Food.fromJson(v))); // Correctly map to Food model
    }
    logoUrl = json['logoUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    verification = json['verification'];
    verificationMessage = json['verificationMessage'];
    coords = json['coords'] != null ? Coords.fromJson(json['coords']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['time'] = this.time;
    data['imageUrl'] = this.imageUrl;
    data['owner'] = this.owner;
    data['code'] = this.code;
    data['isAvailable'] = this.isAvailable;
    data['pickup'] = this.pickup;
    data['delivery'] = this.delivery;
    if (this.foods != null) {
      data['foods'] =
          this.foods!.map((v) => v.toJson()).toList(); // Correctly map to JSON
    }
    data['logoUrl'] = this.logoUrl;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['verification'] = this.verification;
    data['verificationMessage'] = this.verificationMessage;
    if (this.coords != null) {
      data['coords'] = this.coords!.toJson();
    }
    return data;
  }
}

class Coords {
  String? id;
  num? latitude;
  num? longitude;
  String? address;
  String? title;
  num? latitudeDelta;
  num? longitudeDelta;

  Coords(
      {this.id,
      this.latitude,
      this.longitude,
      this.address,
      this.title,
      this.latitudeDelta,
      this.longitudeDelta});

  Coords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    //?.toDouble(); // Ensure the value is a double
    longitude = json['longitude'];
    //?.toDouble(); // Ensure the value is a double
    address = json['address'];
    title = json['title'];
    latitudeDelta = json['latitudeDelta'];
    longitudeDelta = json['longitudeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['title'] = this.title;
    data['latitudeDelta'] = this.latitudeDelta;
    data['longitudeDelta'] = this.longitudeDelta;
    return data;
  }
}

// Define the Food class if necessary
class Food {
  String? name;
  num? price;

  Food({this.name, this.price});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
