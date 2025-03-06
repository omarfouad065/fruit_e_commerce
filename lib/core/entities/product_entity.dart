import 'package:equatable/equatable.dart';
import 'package:fruit_e_commerce/core/entities/review_entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final num unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
  });

  @override
  List<Object?> get props => [code];
}
