
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

 factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic>? toJson() {
    return null;
  }
}
@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

 factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic>? toJson() {
    return null;
  }
}