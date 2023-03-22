import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce/models/models.dart';
import 'package:mobile_ecommerce/widgets/custom_appbar.dart';
import 'package:mobile_ecommerce/widgets/order_summery.dart';

import '../../widgets/order_summery_product_cart.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String routeName = '/orderconfirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => OrderConfirmationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'Return to HomeScreen',
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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('assets/svgs/garlands.svg'),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER CODE: #K321-kde1',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thank you for purchasing on Zero to Unicorn',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ORDER CODE: #K321-kde1',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  const OrderSummery(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummeryProductCard(product: Product.products[0], quatity: 2,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


