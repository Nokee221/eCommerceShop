import 'package:equatable/equatable.dart';
import 'package:mobile_ecommerce/models/models.dart';

class WishList extends Equatable{
  final List<Product> products;

  const WishList({
    this.products = const <Product>[]
  });

  @override
  List<Object?> get props => [products];

}