import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuatity(product) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      }else{
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

  static double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
