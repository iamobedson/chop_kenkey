//@dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:paystack_manager/paystack_manager.dart';

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
                  onTap: () {},
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          height: 150.0,
                          width: 150.0,
                          child: Image.asset('assets/vodacashlogo.jpeg'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Pay with Stripe',
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

  void _checkPayment() {
    try {
      PaystackPayManager(context: null)
        ..setSecretKey("sk_live_e254ed422fe4630adc2765efd594b3952edec808")
        ..setCompanyAssetImage(
          Image(
            image: NetworkImage(
                "https://apimgmtst14nbxosi1zkfy2r.blob.core.windows.net/content/MediaLibrary/images/mtnmomo.svg"),
          ),
        )
        ..setAmount('\${state.cart.totalString}')
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("GHC")
        ..setEmail("apollotreasures22@gmail.com")
        ..setFirstName('Obed')
        ..setLastName('Osei-Nyansah')
        ..setMetadata(
          {
            "custom_fielfds": [
              {
                "value": "Chop_Kenkey",
                "display_name": "Payment_to",
                "variable_name": "Payment_to",
              }
            ]
          },
        )
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print('Payment Error ==> $error');
    }
  }

  void _onPaymentSuccessful() {}

  void _onPaymentPending() {}

  void _onPaymentFailed() {}

  void _onCancel() {}
}
