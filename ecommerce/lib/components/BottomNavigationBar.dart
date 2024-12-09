import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  const Bottomnavigationbar({super.key, required this.selectedIndex, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTap,
      currentIndex: selectedIndex,
      backgroundColor: Theme.of(context).colorScheme.surface,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        )
      ],
    );
  }
}
