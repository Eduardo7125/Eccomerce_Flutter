import 'package:ecommerce/pages/HorizontalScroll.dart';
import 'package:ecommerce/components/Product.dart';
import 'package:ecommerce/pages/VerticalScroll.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  List<Product> lista = List.generate(
    10,
    (index) => Product(
      title: 'Product Title $index',
      descript: 'This is a description of the product $index.',
      price: .99 + index,
      rating: .5 + (index % 5) * 0.5,
      image: 'assets/zapatilla${index + 1}.jpg',
    ),
  );

  @override
  Widget build(BuildContext context) => const Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          Horizontalscroll(),
          // Verticalscroll()
        ],
      )));
}
