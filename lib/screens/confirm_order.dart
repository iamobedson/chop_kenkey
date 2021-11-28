//@dart=2.9
// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:chop_kenkey/screens/screens.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

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
  TextEditingController _email = TextEditingController();
  TextEditingController _amount = TextEditingController();

  String _ref;

  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);

    if (Platform.isAndroid) {
      setState(() {
        _ref = "AndroidRef+233$number";
      });
    } else {
      setState(() {
        _ref = "iOSRef+233$number";
      });
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Confirm Order'),
      bottomNavigationBar: CustomBottomNavBar(screen: ConfirmOrder.routeName),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: TextFormField(
              controller: _email,
              decoration: InputDecoration(labelText: "Enter Email"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: TextFormField(
              controller: _amount,
              decoration: InputDecoration(labelText: "Enter Total Amount Here"),
            ),
          ),

          //payment Button
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                final email = _email.text;
                final amount = _amount.text;

                if (email.isEmpty || amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Fields are empty!!"),
                    ),
                  );
                } else {
                  //Proceed to Flutterwave Payment
                  _makePayment(context, email.trim(), amount.trim());
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(color: Colors.orangeAccent),
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

  void _makePayment(BuildContext context, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST93ce2c0f76d2",
          publicKey: "FLWPUBK_TEST-543ca18030f9a00d36be4e9bec126854-X",
          currency: "GHS",
          amount: amount,
          email: "$email",
          fullName: displayName,
          txRef: _ref,
          isDebugMode: true,
          //phoneNumber: "0123456789",
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: true,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();

      if (response.data == null) {
        print("Transaction Failed");
      } else {
        print(response.message);
        print(response.status);
      }
    } catch (error) {
      print(error);
    }
  }
}
