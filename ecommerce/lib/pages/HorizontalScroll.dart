import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/components/cardWidget.dart';
import 'package:ecommerce/components/Product.dart';
import 'package:flutter/material.dart';

class Horizontalscroll extends StatefulWidget {
  const Horizontalscroll({super.key});

  @override
  State<Horizontalscroll> createState() => _LandingState();
}

class _LandingState extends State<Horizontalscroll> {
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: lista.map((e) {
        bool isVisible = lista.indexOf(e) == _currentIndex;
        return CardWidget(cart: e, isVisible: isVisible);
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        aspectRatio: 2,
        viewportFraction: 0.6,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
