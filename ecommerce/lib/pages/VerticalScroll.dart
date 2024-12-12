import 'package:ecommerce/components/Product.dart';
import 'package:ecommerce/components/cardWidget.dart';
import 'package:ecommerce/components/cardWidgetVertical.dart';
import 'package:flutter/material.dart';

class Verticalscroll extends StatefulWidget {
  const Verticalscroll({super.key});

  @override
  State<Verticalscroll> createState() => _VerticalscrollState();
}

class _VerticalscrollState extends State<Verticalscroll> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final itemPositionOffset = index * 200;
                final difference = scrollController.offset - itemPositionOffset;
                final percent = 1 - (difference / 200);
                double opacity = percent;
                opacity > 1.0 = 1.0;
                opacity < 0.0 ?? opacity = 0.0;


                return Cardwidgetvertical(
                  cart: lista[index],
                  opacity: opacity,
                );
              },
              childCount: lista.length,
            ),
          ),
        ],
      ),
    );
  }
}
