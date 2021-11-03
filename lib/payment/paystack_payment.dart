//@dart=2.9
import 'dart:io';

import 'package:chop_kenkey/payment/paystacy_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class MakePayment {
  MakePayment({context, price, email});

  BuildContext context;
  int price;
  String email;

  PaystackPlugin paystack = PaystackPlugin();

  //Reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //Get UI
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  //Method for charging card
  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price
        ..email = email
        ..reference = _getReference()
        ..currency = 'GHS'
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.selectable,
        fullscreen: false,
        hideEmail: false,
        hideAmount: false,
        logo: Image.asset('assets/kenkey_icon.png', height: 100.0, width: 100),
      );

      print("Response $response");

      if (response.status == true) {
        print("Transaction successful");
      } else {
        print("Transaction failed,, ");
      }
    });
  }
}
