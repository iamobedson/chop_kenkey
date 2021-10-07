//@dart=2.9

import 'package:chop_kenkey/blocs/cart/cart_bloc.dart';
import 'package:chop_kenkey/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:chop_kenkey/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key key, this.product, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Flexible(
            child: Image.asset(
              product.imageUrl,
              width: 100,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context).textTheme.headline6),
                Text('\$${product.price}',
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          const SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            CartProductRemoved(product),
                          );
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Text('$quantity', style: Theme.of(context).textTheme.headline6),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            CartProductAdded(product),
                          );
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
