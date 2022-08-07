import 'package:flutter/material.dart';
import 'package:project1/core/store.dart';
import 'package:project1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(notifications: {},
          builder: (context,_,__) {
            return "\$${_cart.totalPrice}".text.xl3.color(Colors.black).make();
            }, 
          mutations: {RemoveMutation},),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet".text.make(),
              ));
            },
            child: "Buy".text.make(),
          ).w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            RemoveMutation(_cart.items[index]);
          },
          icon: Icon(Icons.remove_circle_outline),
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
