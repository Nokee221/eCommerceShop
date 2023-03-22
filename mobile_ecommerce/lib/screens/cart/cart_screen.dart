import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ecommerce/models/product_model.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add \$20.0 for FREE Delivery',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.black),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0,
                              ),
                              child: Text(
                                'Add More Items',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.cart.productQuatity(state.cart.products).keys.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart.productQuatity(state.cart.products).keys.elementAt(index),
                                quatity: state.cart.productQuatity(state.cart.products).values.elementAt(index)
                              );
                            },
                          ),
                        ),
                        const OrderSummery(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
