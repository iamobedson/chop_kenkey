//@dart=2.9
// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element

import 'package:chop_kenkey/blocs/cart/cart_bloc.dart';
import 'package:chop_kenkey/blocs/checkout/checkout_bloc.dart';
import 'package:chop_kenkey/models/checkout_model.dart';
import 'package:chop_kenkey/screens/cart_screen.dart';
import 'package:chop_kenkey/screens/catalog.dart';
import 'package:chop_kenkey/screens/checkout.dart';
import 'package:chop_kenkey/screens/dashboard.dart';
import 'package:chop_kenkey/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var orangeColor = const Color(0xffe8730d);

class CustomBottomNavBar extends StatelessWidget {
  final String screen;

  CustomBottomNavBar({
    Key key,
    this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen),
        ),
      ),
    );
  }

  List<Widget> _selectNavBar(context, screen) {
    switch (screen) {
      case Dashboard.routeName:
        return _buildNavBar(context);
      case CatalogScreen.routeName:
        return _buildNavBar(context);
      case CartScreen.routeName:
        return _buildGoToCheckoutNavBar(context);
      case CheckoutScreen.routeName:
        return _buildOrderNowNavBar(context);

      default:
        return _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.black),
        onPressed: () {
          Navigator.pushNamed(context, Dashboard.routeName);
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.black),
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
      IconButton(
        icon: Icon(Icons.person, color: Colors.black),
        onPressed: () {
          Navigator.pushNamed(context, Profile.routeName);
        },
      )
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        icon: Icon(Icons.share, color: Colors.black),
        onPressed: () {},
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'ADD TO CART',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          return Text('Something went wrong!');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, CheckoutScreen.routeName);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(),
              ),
              child: Text('ORDER NOW',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white)),
            );
          } else {
            return Text('Something went wrong');
          }
        },
      )
    ];
  }
}
