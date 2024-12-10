import 'package:ecommerce/components/Product.dart';
import 'package:ecommerce/components/cardWidget.dart';
import 'package:ecommerce/components/cardWidgetHorizontal.dart';
import 'package:flutter/material.dart';

class Horizontalscroll extends StatefulWidget {
  const Horizontalscroll({super.key});

  @override
  State<Horizontalscroll> createState() => _HorizontalscrollState();
}

class _HorizontalscrollState extends State<Horizontalscroll> {
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

  // Controlador para el scroll horizontal
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  // Función para calcular las transformaciones
// ... (resto del código)

double _calculateRotation(int index) {
  double itemWidth = 200.0;
  double distanceFromCenter = (_scrollOffset - (index * itemWidth)) / itemWidth;

  // Ajusta el máximo ángulo de rotación según tus preferencias
  double maxRotation = 0.2; // Rotación máxima en radianes

  // Calcula la rotación, asegurándonos de que sea simétrica
  double rotation = maxRotation * distanceFromCenter.abs();

  // Invierte la rotación para las tarjetas a la izquierda del centro
  if (distanceFromCenter < 0) {
    rotation *= -1;
  }

  return rotation;
}

// ... (resto del código)

  // Función para calcular el desplazamiento vertical
double _calculateVerticalOffset(int index) {
  double itemWidth = 200.0;
  double distanceFromCenter = (_scrollOffset - (index * itemWidth)) / itemWidth;

  // Calculate the vertical offset (adjust the maximum value as needed)
  double maxVerticalOffset = 20.0;
  double verticalOffset = maxVerticalOffset * distanceFromCenter.abs();

  // Scale the vertical offset to the 0-1 range
  double scaledVerticalOffset = verticalOffset / maxVerticalOffset;

  return scaledVerticalOffset;
}

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = 200.0; // Ancho estimado de cada tarjeta
    double minCardsToShow = 3; // Queremos mostrar al menos 3 tarjetas
    double screenWidth = MediaQuery.of(context).size.width; // Ancho de la pantalla
    double requiredWidth = minCardsToShow * itemWidth; // Ancho total para mostrar 3 tarjetas

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            _scrollOffset = notification.metrics.pixels;
          });
        }
        return true;
      },
      child: Container(
        height: 300.0, // Puedes ajustar este valor a la altura que desees para el scroll
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(lista.length, (index) {
              // Calculamos la rotación para cada elemento en función de su posición
              double rotation = _calculateRotation(index);

              // Calculamos el desplazamiento vertical para los elementos
              double verticalOffset = _calculateVerticalOffset(index);

              // Aplicamos la rotación y el desplazamiento vertical
              return Transform.translate(
                offset: Offset(0.0, verticalOffset), // Mover los elementos hacia abajo
                child: Transform.rotate(
                  angle: rotation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Cardwidgethorizontal(producto: lista[index]),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}