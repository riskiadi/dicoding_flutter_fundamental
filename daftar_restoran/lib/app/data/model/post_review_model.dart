class PostReviewModel {
  PostReviewModel({
      this.id, 
      this.name, 
      this.review,});

  PostReviewModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    review = json['review'];
  }
  String? id;
  String? name;
  String? review;
PostReviewModel copyWith({  String? id,
  String? name,
  String? review,
}) => PostReviewModel(  id: id ?? this.id,
  name: name ?? this.name,
  review: review ?? this.review,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['review'] = review;
    return map;
  }

}