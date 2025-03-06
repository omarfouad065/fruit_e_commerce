import 'package:fruit_e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
      name: 'Apple',
      code: '123',
      description: 'Fresh Apple',
      price: 2.5,
      reviews: [],
      expirationMonths: 6,
      numberOfCalories: 100,
      unitAmount: 1,
      isOrganic: true,
      isFeatured: true,
      imageUrl:
          'https://upgnlzqypnrdetexcluy.supabase.co/storage/v1/object/public/fruits_images/images/MainBefore.jpg');
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
