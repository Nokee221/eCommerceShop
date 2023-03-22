import 'package:flutter/material.dart';

import '../models/product_model.dart';

class OrderSummeryProductCard extends StatelessWidget {
  final Product product;
  final int quatity;

  const OrderSummeryProductCard({ required this.product , required this.quatity , 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
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
                  quatity.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              product.price.toString() + 'KM',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}