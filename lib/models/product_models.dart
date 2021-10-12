//@dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    this.name,
    this.category,
    this.price,
    this.imageUrl,
    this.isRecommended,
    this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  @override
  List<Object> get props => [name, category, price, imageUrl, isRecommended];

  static List<Product> products = [
    Product(
      name: 'Ga Kenkey',
      category: 'Kenkey',
      price: 5.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-wVcKShb/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Fante Kenkey',
      category: 'Kenkey',
      price: 10.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-n4sXDcS/A',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Grilled Tilapia',
      category: 'Proteins',
      price: 15.50,
      imageUrl:
          'https://www.dropbox.com/s/nfdsmvmk6b9rhic/grilled%20tilapia.jpeg?dl=0',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Fried Pork',
      category: 'Proteins',
      price: 20.50,
      imageUrl:
          'https://images.unsplash.com/photo-1625477811233-044633d10dd1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Fried Shrimps',
      category: 'Proteins',
      price: 10.50,
      imageUrl:
          'https://images.unsplash.com/photo-1633504581786-316c8002b1b9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Fried Eggs',
      category: 'Proteins',
      price: 10.50,
      imageUrl:
          'https://www.dropbox.com/s/a2eixypx4937jl5/fried_eggs.jpeg?dl=0',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Fried Fish',
      category: 'Proteins',
      price: 5.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-LDVwdkR/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Green Chilli Sauce',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://www.dropbox.com/s/u6b4avguiqrwr5i/green_chilli.png?dl=0',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Shitor',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://www.dropbox.com/s/9090673ljvytz9v/shito.jpeg?dl=0',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Okro Stew',
      category: 'Stews',
      price: 10.50,
      imageUrl:
          'https://www.dropbox.com/s/33tm37xojj1tc6b/okro_stew.jpeg?dl=0',
      isRecommended: true,
      isPopular: true,
    )
  ];
}
