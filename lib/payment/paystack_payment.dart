//@dart=2.9
import 'package:chop_kenkey/payment/paystacy_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class MakePayment {
  MakePayment({this.context, this.price, this.email});

  BuildContext context;
  int price;
  String email;

  PaystackPlugin paystack = PaystackPlugin();

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }
}
