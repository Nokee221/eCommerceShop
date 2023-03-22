import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quatity;

  const CartProductCard(
      {required this.quatity, required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  product.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveProduct(product));
                      },
                      icon: const Icon(Icons.remove_circle)),
                  Text(
                    quatity.toString(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddProduct(product));
                      },
                      icon: const Icon(Icons.add_circle))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
