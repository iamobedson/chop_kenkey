// ignore_for_file: use_key_in_widget_constructors

import 'package:chop_kenkey/models/models.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = "/catalog";

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomBottomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 20.0,
        ),
        itemCount: categoryProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.14,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
