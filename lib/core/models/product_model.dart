import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/core/helper_functions/get_avg_rating.dart';
import 'package:fruit_e_commerce/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final num unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.avgRating,
    required this.unitAmount,
    required this.sellingCount,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'],
        code: json['code'],
        description: json['description'],
        expirationMonths: json['expirationMonths'],
        numberOfCalories: json['numberOfCalories'],
        avgRating: getAvgRating(json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : []),
        unitAmount: json['unitAmount'],
        sellingCount: json['sellingCount'],
        reviews: json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : [],
        price: json['price'],
        isOrganic: json['isOrganic'],
        isFeatured: json['isFeatured'],
        imageUrl: json['imageUrl']);
  }

  ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        reviews: reviews.map((e) => e.toEntity()).toList(),
        expirationMonths: expirationMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        isFeatured: isFeatured,
        imageUrl: imageUrl);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
