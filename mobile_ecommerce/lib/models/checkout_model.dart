import 'package:equatable/equatable.dart';
import 'package:mobile_ecommerce/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  const Checkout({
    required this.address,
    required this.city,
    required this.country,
    required this.deliveryFee,
    required this.email,
    required this.fullName,
    required this.products,
    required this.subtotal,
    required this.total,
    required this.zipCode,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products
      ];

   Map<String,Object> toDocument(){
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return{
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((e) => e.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };

   }
}
