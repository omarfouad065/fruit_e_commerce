import 'package:fruit_e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phoneNumber;
  String? address;
  String? city;
  String? email;

  String? floor;

  ShippingAddressModel({
    this.name,
    this.phoneNumber,
    this.address,
    this.city,
    this.email,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      floor: entity.floor,
    );
  }

  @override
  String toString() {
    return '$address, $floor, $city';
  }

  toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }
}
