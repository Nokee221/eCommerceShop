import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ecommerce/widgets/custom_appbar.dart';
import 'package:mobile_ecommerce/widgets/custom_navbar.dart';
import 'package:mobile_ecommerce/widgets/widgets.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../order_confirmation/order_confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'CheckOut'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(ConfirmCheckout(checkout: state.checkout));
                        Navigator.pushNamed(
                            context, OrderConfirmationScreen.routeName);
                      },
                      child: Text(
                        'ORDER NOW',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.black),
                      ),
                    );
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Name'),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    }, context, 'Zip Code'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/payment-selection',
                                );
                              },
                              child: Text(
                                'SELECT A PAYMENT METHOD',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    const OrderSummery(),
                  ],
                );
              } else {
                return const Text('Something went wrong!');
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(
      Function(String?) onChanged, BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
