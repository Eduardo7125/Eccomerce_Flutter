import 'package:flutter/material.dart';
import 'package:ecommerce/components/Product.dart';

class Cardwidgetvertical extends StatelessWidget {
  final Product cart;
  final double opacity;
  const Cardwidgetvertical(
      {super.key, required this.cart, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Card(
        color: Colors.amber,
        child: SizedBox(
          height: 200,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    cart.title,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                  Text(cart.descript),
                ],
              ),
              Image.asset(cart.image),
            ],
          ),
        ),
      ),
    );
  }
}
