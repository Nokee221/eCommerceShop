import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:mobile_ecommerce/blocs/category/category_bloc.dart';
import 'package:mobile_ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:mobile_ecommerce/config/app_router.dart';
import 'package:mobile_ecommerce/config/theme.dart';
import 'package:mobile_ecommerce/models/cart_model.dart';
import 'package:mobile_ecommerce/repositories/auth/auth_repository.dart';
import 'package:mobile_ecommerce/repositories/category/category_repository.dart';
import 'package:mobile_ecommerce/repositories/checkout/checkout_repository.dart';
import 'package:mobile_ecommerce/repositories/product/product_repository.dart';
import 'package:mobile_ecommerce/screens/home/home_screen.dart';
import 'package:mobile_ecommerce/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:mobile_ecommerce/screens/screens.dart';

import 'blocs/app/app_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'blocs/wishlistt/wishlist_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepository();

  BlocOverrides.runZoned((() {
    runApp(MyApp(authRepository: authRepository,));
  }));
}

class MyApp extends StatelessWidget {

  final authRepository;
  MyApp({required this.authRepository , Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
      ],
      child: MaterialApp(
        title: "Zero to Unicorn",
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        
      ),
    );
  }
}
