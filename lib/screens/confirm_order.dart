//@dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class ConfirmOrder extends StatelessWidget {
  static const String routeName = '/confirm_order';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ConfirmOrder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Confirm Order'),
      bottomNavigationBar: CustomBottomNavBar(screen: routeName),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(
                    'SELECT A PAYMENT METHOD',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
                Icon(
                  Icons.security,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    //call paystack payment
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 180.0,
                        width: 180.0,
                        child: Image.asset('assets/mtnmomo.jpeg'),
                      ),
                      Text(
                        'Pay with Momo',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      //call paystack payment
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 140.0,
                          width: 140.0,
                          child: Image.asset('assets/vodacashlogo.jpeg'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Pay with VodaCash',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          OrderSummary(),
        ],
      ),
    );
  }
}
