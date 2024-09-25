class RestaurantModel {
  String? sId;
  String? title;
  String? time;
  String? imageUrl;
  List<String>? foods;
  bool? pickup;
  bool? delivery;
  String? owner;
  bool? isAvailable;
  String? code;
  String? logoUrl;
  int? rating;
  String? ratingCount;
  String? verification;
  String? verificationMessage;
  Coords? coords;
  double? earnings;

  RestaurantModel({
    this.sId,
    this.title,
    this.time,
    this.imageUrl,
    this.foods,
    this.pickup,
    this.delivery,
    this.owner,
    this.isAvailable,
    this.code,
    this.logoUrl,
    this.rating,
    this.ratingCount,
    this.verification,
    this.verificationMessage,
    this.coords,
    this.earnings,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      sId: json['_id'],
      title: json['title'],
      time: json['time'],
      imageUrl: json['imageUrl'],
      foods: List<String>.from(json['foods']),
      pickup: json['pickup'],
      delivery: json['delivery'],
      owner: json['owner'],
      isAvailable: json['isAvailable'],
      code: json['code'],
      logoUrl: json['logoUrl'],
      rating: json['rating'],
      ratingCount: json['ratingCount'],
      verification: json['verification'],
      verificationMessage: json['verificationMessage'],
      coords: json['coords'] != null ? Coords.fromJson(json['coords']) : null,
      earnings: json['earnings'],
    );
  }
}

class Coords {
  String? id;
  double? latitude;
  double? longitude;
  String? address;
  String? title;
  double? latitudeDelta;
  double? longitudeDelta;

  Coords({
    this.id,
    this.latitude,
    this.longitude,
    this.address,
    this.title,
    this.latitudeDelta,
    this.longitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) {
    return Coords(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      title: json['title'],
      latitudeDelta: json['latitudeDelta'],
      longitudeDelta: json['longitudeDelta'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'title': title,
      'latitudeDelta': latitudeDelta,
      'longitudeDelta': longitudeDelta,
    };
  }
}
