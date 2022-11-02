class SearchRestaurantModel {
  SearchRestaurantModel({
      this.error, 
      this.founded, 
      this.restaurantsSearch,});

  SearchRestaurantModel.fromJson(dynamic json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurantsSearch = [];
      json['restaurants'].forEach((v) {
        restaurantsSearch?.add(RestaurantsSearch.fromJson(v));
      });
    }
  }
  bool? error;
  num? founded;
  List<RestaurantsSearch>? restaurantsSearch;
SearchRestaurantModel copyWith({  bool? error,
  num? founded,
  List<RestaurantsSearch>? restaurants,
}) => SearchRestaurantModel(  error: error ?? this.error,
  founded: founded ?? this.founded,
  restaurantsSearch: restaurants ?? this.restaurantsSearch,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['founded'] = founded;
    if (restaurantsSearch != null) {
      map['restaurants'] = restaurantsSearch?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RestaurantsSearch {
  RestaurantsSearch({
      this.id, 
      this.name, 
      this.description, 
      this.pictureId, 
      this.city, 
      this.rating,});

  RestaurantsSearch.fromJson(dynamic json) {
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
  RestaurantsSearch copyWith({  String? id,
  String? name,
  String? description,
  String? pictureId,
  String? city,
  num? rating,
}) => RestaurantsSearch(  id: id ?? this.id,
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