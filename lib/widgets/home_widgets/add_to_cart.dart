import 'package:flutter/material.dart';
import 'package:project1/core/store.dart';
import 'package:project1/models/cart.dart';
import 'package:project1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    
    bool isinCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isinCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isinCart ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
