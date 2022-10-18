class RestaurantListModel {
  RestaurantListModel({
      this.error, 
      this.message, 
      this.count, 
      this.restaurants,});

  RestaurantListModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(Restaurants.fromJson(v));
      });
    }
  }
  bool? error;
  String? message;
  num? count;
  List<Restaurants>? restaurants;
RestaurantListModel copyWith({  bool? error,
  String? message,
  num? count,
  List<Restaurants>? restaurants,
}) => RestaurantListModel(  error: error ?? this.error,
  message: message ?? this.message,
  count: count ?? this.count,
  restaurants: restaurants ?? this.restaurants,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    map['count'] = count;
    if (restaurants != null) {
      map['restaurants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Restaurants {
  Restaurants({
      this.id, 
      this.name, 
      this.description, 
      this.pictureId, 
      this.city, 
      this.rating,});

  Restaurants.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  num? rating;
Restaurants copyWith({  String? id,
  String? name,
  String? description,
  String? pictureId,
  String? city,
  num? rating,
}) => Restaurants(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  pictureId: pictureId ?? this.pictureId,
  city: city ?? this.city,
  rating: rating ?? this.rating,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['pictureId'] = pictureId;
    map['city'] = city;
    map['rating'] = rating;
    return map;
  }

}