import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(image)
            .box
            .p16
            .color(Color.fromARGB(255, 255, 255, 255))
            .make()
            .p16());
  }
}