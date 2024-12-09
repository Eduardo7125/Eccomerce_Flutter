import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget  {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Eccomerce"),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}