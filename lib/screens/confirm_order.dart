//@dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:chop_kenkey/payment/paystack_payment.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key key}) : super(key: key);
  static const String routeName = '/confirm_order';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ConfirmOrder(),
    );
  }

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  int selectedIndex;
  int price;
  String email = "apollotreasures2@live.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Confirm Order'),
      bottomNavigationBar: CustomBottomNavBar(screen: ConfirmOrder.routeName),
      body: Column(
        children: [
          SizedBox(height: 20),
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
          SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              children: List.generate(paymentPlans.length, (index) {
                final payment = paymentPlans[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      price = payment["price"];
                    });
                  },
                  child: Card(
                    color: Colors.amber,
                    shadowColor: Colors.orangeAccent,
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: selectedIndex == null
                            ? null
                            : selectedIndex == index
                                ? orangeColor
                                : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${payment["network"]}",
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                //Navigate to Paystack Charge Page
                //Navigator.pushReplacement(context, PaystackCharge.route());

                //call paystack
                MakePayment(
                  context: context,
                  email: email,
                ).chargeCardAndMakePayment();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(color: orangeColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'MAKE PAYMENT',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Icon(
                      Icons.security,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          OrderSummary(),
        ],
      ),
    );
  }

  final paymentPlans = [
    {"network": 233543456808, "price": 10},
    {"network": 233206226354, "price": 10},
  ];
}
