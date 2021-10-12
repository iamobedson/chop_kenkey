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
          'https://i.pinimg.com/originals/26/b3/14/26b314997ecd1fe1bb713821d748f9a3.jpg',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Fante Kenkey',
      category: 'Kenkey',
      price: 10.50,
      imageUrl:
          'https://i.pinimg.com/474x/4b/0d/de/4b0dde50b657b599931ad715b14ca133.jpg',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Grilled Tilapia',
      category: 'Proteins',
      price: 15.50,
      imageUrl:
          'https://images.unsplash.com/photo-1606234157216-2e1fcbf0c140?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
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
          'https://images.unsplash.com/photo-1608039762150-b682eb589303?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGZyaWVkJTIwZWdnc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Fried Fish',
      category: 'Proteins',
      price: 5.50,
      imageUrl:
          'https://images.unsplash.com/photo-1565733618599-cb82f14f34ac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=735&q=80',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Green Chilli Sauce',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://images.unsplash.com/photo-1583027475794-4c02423a979c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Shitor',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://images.unsplash.com/photo-1608500219063-e5164085cd6f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Okro Stew',
      category: 'Stews',
      price: 10.50,
      imageUrl:
          'https://images.unsplash.com/photo-1568640895956-e2bad65027b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=801&q=80',
      isRecommended: true,
      isPopular: true,
    )
  ];
}
