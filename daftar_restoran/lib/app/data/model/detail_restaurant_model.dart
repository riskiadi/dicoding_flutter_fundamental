class DetailRestaurantModel {
  DetailRestaurantModel({
      this.error, 
      this.message, 
      this.restaurant,});

  DetailRestaurantModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    restaurant = json['restaurant'] != null ? Restaurant.fromJson(json['restaurant']) : null;
  }
  bool? error;
  String? message;
  Restaurant? restaurant;
DetailRestaurantModel copyWith({  bool? error,
  String? message,
  Restaurant? restaurant,
}) => DetailRestaurantModel(  error: error ?? this.error,
  message: message ?? this.message,
  restaurant: restaurant ?? this.restaurant,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    if (restaurant != null) {
      map['restaurant'] = restaurant?.toJson();
    }
    return map;
  }

}

class Restaurant {

  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Categories>? categories;
  Menus? menus;
  num? rating;
  List<CustomerReviews>? customerReviews;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  Restaurant.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    address = json['address'];
    pictureId = json['pictureId'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
    rating = json['rating'];
    if (json['customerReviews'] != null) {
      customerReviews = [];
      json['customerReviews'].forEach((v) {
        customerReviews?.add(CustomerReviews.fromJson(v));
      });
    }
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    List<Categories>? categories,
    Menus? menus,
    num? rating,
    List<CustomerReviews>? customerReviews,
  }) => Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        city: city ?? this.city,
        address: address ?? this.address,
        pictureId: pictureId ?? this.pictureId,
        categories: categories ?? this.categories,
        menus: menus ?? this.menus,
        rating: rating ?? this.rating,
        customerReviews: customerReviews ?? this.customerReviews,
      );


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['city'] = city;
    map['address'] = address;
    map['pictureId'] = pictureId;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (menus != null) {
      map['menus'] = menus?.toJson();
    }
    map['rating'] = rating;
    if (customerReviews != null) {
      map['customerReviews'] = customerReviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Map<String, dynamic> toJsonFav() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['city'] = city;
    map['address'] = address;
    map['pictureId'] = pictureId;
    map['rating'] = rating;
    return map;
  }

}

class CustomerReviews {
  CustomerReviews({
      this.name, 
      this.review, 
      this.date,});

  CustomerReviews.fromJson(dynamic json) {
    name = json['name'];
    review = json['review'];
    date = json['date'];
  }
  String? name;
  String? review;
  String? date;
CustomerReviews copyWith({  String? name,
  String? review,
  String? date,
}) => CustomerReviews(  name: name ?? this.name,
  review: review ?? this.review,
  date: date ?? this.date,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['review'] = review;
    map['date'] = date;
    return map;
  }

}

class Menus {
  Menus({
      this.foods, 
      this.drinks,});

  Menus.fromJson(dynamic json) {
    if (json['foods'] != null) {
      foods = [];
      json['foods'].forEach((v) {
        foods?.add(Foods.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks?.add(Drinks.fromJson(v));
      });
    }
  }
  List<Foods>? foods;
  List<Drinks>? drinks;
Menus copyWith({  List<Foods>? foods,
  List<Drinks>? drinks,
}) => Menus(  foods: foods ?? this.foods,
  drinks: drinks ?? this.drinks,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    if (drinks != null) {
      map['drinks'] = drinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Drinks {
  Drinks({
      this.name,});

  Drinks.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;
Drinks copyWith({  String? name,
}) => Drinks(  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}

class Foods {
  Foods({
      this.name,});

  Foods.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;
Foods copyWith({  String? name,
}) => Foods(  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}

class Categories {
  Categories({
      this.name,});

  Categories.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;
Categories copyWith({  String? name,
}) => Categories(  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}