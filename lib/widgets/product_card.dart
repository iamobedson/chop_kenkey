// @dart=2.9
// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:chop_kenkey/blocs/cart/cart_bloc.dart';
import 'package:chop_kenkey/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:chop_kenkey/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  const ProductCard({
    Key key,
    this.product,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 180.0,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Positioned(
              top: 75.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 5.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5 - 10,
                height: 65.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\GHC ${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));

                                  final snackBar = SnackBar(
                                      content: Text('Added to your Cart!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon:
                                    Icon(Icons.add_circle, color: Colors.white),
                              ),
                            );
                          } else {
                            return Text('Something went wrong.');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
