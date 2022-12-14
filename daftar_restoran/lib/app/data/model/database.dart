class LocalRestaurant {

  List<Restaurants>? _restaurants;

  List<Restaurants>? get restaurants => _restaurants;

  LocalRestaurant({
    List<Restaurants>? restaurants,
  }) {
    _restaurants = restaurants;
  }

  LocalRestaurant.fromJson(dynamic json) {
    if (json['restaurants'] != null) {
      _restaurants = [];
      json['restaurants'].forEach((v) {
        _restaurants?.add(Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_restaurants != null) {
      map['restaurants'] = _restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Restaurants {
  Restaurants({
    String? id,
    String? name,
    String? description,
    String? pictureId,
    String? city,
    num? rating,
    Menus? menus,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _pictureId = pictureId;
    _city = city;
    _rating = rating;
    _menus = menus;
  }

  Restaurants.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _pictureId = json['pictureId'];
    _city = json['city'];
    _rating = json['rating'];
    _menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
  }

  String? _id;
  String? _name;
  String? _description;
  String? _pictureId;
  String? _city;
  num? _rating;
  Menus? _menus;

  String? get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get pictureId => _pictureId;

  String? get city => _city;

  num? get rating => _rating;

  Menus? get menus => _menus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['pictureId'] = _pictureId;
    map['city'] = _city;
    map['rating'] = _rating;
    if (_menus != null) {
      map['menus'] = _menus?.toJson();
    }
    return map;
  }
}

class Menus {
  Menus({
    List<Foods>? foods,
    List<Drinks>? drinks,
  }) {
    _foods = foods;
    _drinks = drinks;
  }

  Menus.fromJson(dynamic json) {
    if (json['foods'] != null) {
      _foods = [];
      json['foods'].forEach((v) {
        _foods?.add(Foods.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      _drinks = [];
      json['drinks'].forEach((v) {
        _drinks?.add(Drinks.fromJson(v));
      });
    }
  }

  List<Foods>? _foods;
  List<Drinks>? _drinks;

  List<Foods>? get foods => _foods;

  List<Drinks>? get drinks => _drinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_foods != null) {
      map['foods'] = _foods?.map((v) => v.toJson()).toList();
    }
    if (_drinks != null) {
      map['drinks'] = _drinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Drinks {
  Drinks({
    String? name,
  }) {
    _name = name;
  }

  Drinks.fromJson(dynamic json) {
    _name = json['name'];
  }

  String? _name;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }
}

class Foods {
  Foods({
    String? name,
  }) {
    _name = name;
  }

  Foods.fromJson(dynamic json) {
    _name = json['name'];
  }

  String? _name;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }
}
