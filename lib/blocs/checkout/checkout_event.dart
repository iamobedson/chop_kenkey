//@dart=2.9
// ignore_for_file: prefer_const_constructors_in_immutables

part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String fullName;
  final String email;
  final String address;
  final String number;
  final String city;
  final String region;
  final Cart cart;

  UpdateCheckout({
    this.fullName,
    this.email,
    this.address,
    this.number,
    this.city,
    this.region,
    this.cart,
  });

  @override
  List<Object> get props => [
        fullName,
        email,
        address,
        number,
        city,
        region,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({this.checkout});

  @override
  List<Object> get props => [checkout];
}
