// @dart = 2.9
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chop_kenkey/blocs/checkout/checkout_bloc.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);
  static const String routeName = "/checkout";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => Checkout(),
    );
  }

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final orangeColor = Color(0xffe8730d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Full Name'),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(number: value));
                  }, context, 'Number'),
                  Text(
                    'DELIVERY INFORMATION',
                    style: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Address'),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, 'City'),
                  buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(region: value));
                  }, context, 'Region'),
                  Text(
                    'ORDER SUMMARY',
                    style: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return Text('Something went wrong.');
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: orangeColor,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextFormField(
    Function(String) onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 15.0),
      child: Row(
        children: [
          SizedBox(
            width: 74.0,
            child: Text(
              labelText,
              style: TextStyle(
                  fontFamily: 'Trueno',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: TextFormField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)))))
        ],
      ),
    );
  }
}
