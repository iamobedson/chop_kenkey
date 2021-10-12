//@dart=2.9

// ignore_for_file: prefer_collection_literals

import 'package:chop_kenkey/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String region;
  final List<Product> products;
  final String subtotal;
  final String deliveryFee;
  final String total;

  const Checkout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.region,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
  });

  @override
  List<Object> get props => [
        fullName,
        email,
        address,
        city,
        region,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['region'] = region;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName,
      'customerEmail': email,
      'products': products.map((product) => product.name).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total
    };
  }
}
