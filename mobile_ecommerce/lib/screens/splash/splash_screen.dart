import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_ecommerce/screens/home/home_screen.dart';
import 'package:mobile_ecommerce/screens/login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
              width: 125,
              height: 125,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Mobile eCommerce',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
