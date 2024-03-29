import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            AddToCart(catalog: catalog,).wh(120, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Diam lorem sea lorem consetetur voluptua sanctus diam voluptua takimata. Sadipscing kasd labore erat sit rebum labore, diam ipsum vero est clita dolor aliquyam, dolor ut diam accusam voluptua eirmod takimata labore invidunt, sit ipsum duo et dolore sed sit sit diam clita. Et dolor amet magna lorem dolor lorem."
                    .text.make().p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
