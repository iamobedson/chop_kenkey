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
      category: 'Carbs',
      price: 5.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-wVcKShb/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Fante Kenkey',
      category: 'Carbs',
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
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-WtGgKJm/A',
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Fried Pork',
      category: 'Proteins',
      price: 20.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-WWRNv4r/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Fried Shrimps',
      category: 'Proteins',
      price: 10.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-XV3WRDk/A',
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Fried Eggs',
      category: 'Proteins',
      price: 10.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-7q96dTr/A',
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
      name: 'One-Man Thousand',
      category: 'Proteins',
      price: 10.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-xVw5dzK/A',
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Green Chilli Sauce',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-GvbvQ27/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Shitor',
      category: 'Stews',
      price: 5.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-JpwLh8n/A',
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Okro Stew',
      category: 'Stews',
      price: 10.50,
      imageUrl:
          'https://obedosei-nyansah.smugmug.com/ChopKenkey-Gallery/i-zP29jKC/A',
      isRecommended: true,
      isPopular: true,
    )
  ];
}
