import 'package:ecommerce/components/Product.dart';
import 'package:flutter/material.dart';

class Cardwidgethorizontal extends StatelessWidget {
  final Product producto;
   
  const Cardwidgethorizontal({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 121,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          producto.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
