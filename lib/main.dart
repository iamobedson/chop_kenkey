// @dart = 2.9

// ignore_for_file: use_key_in_widget_constructors

import 'package:chop_kenkey/blocs/cart/cart_bloc.dart';
import 'package:chop_kenkey/blocs/category/category_bloc.dart';
import 'package:chop_kenkey/blocs/checkout/checkout_bloc.dart';
import 'package:chop_kenkey/blocs/product/product_bloc.dart';
import 'package:chop_kenkey/config/app_router.dart';
import 'package:chop_kenkey/repositories/category/category_repo.dart';
import 'package:chop_kenkey/repositories/checkout/checkout_repo.dart';
import 'package:chop_kenkey/screens/splash_screen.dart';
import 'package:chop_kenkey/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'repositories/product/product_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(ChopKenkey());
}

class ChopKenkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProducts(),
            ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      // ignore: prefer_const_constructors
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
