class SearchRestaurantModel {
  SearchRestaurantModel({
      this.error, 
      this.founded, 
      this.restaurants,});

  SearchRestaurantModel.fromJson(dynamic json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(Restaurants.fromJson(v));
      });
    }
  }
  bool? error;
  num? founded;
  List<Restaurants>? restaurants;
SearchRestaurantModel copyWith({  bool? error,
  num? founded,
  List<Restaurants>? restaurants,
}) => SearchRestaurantModel(  error: error ?? this.error,
  founded: founded ?? this.founded,
  restaurants: restaurants ?? this.restaurants,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['founded'] = founded;
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