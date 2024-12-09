import 'package:ecommerce/components/Appbar.dart';
import 'package:ecommerce/components/BottomNavigationBar.dart';
import 'package:ecommerce/components/Product.dart';
import 'package:ecommerce/pages/CartPage.dart';
import 'package:ecommerce/pages/LandingPage.dart';
import 'package:ecommerce/tools/Colors.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'eccomerce.db'),
    onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE Products(title TEXT PRIMARY KEY, descript TEXT, money REAL, rating REAL, image TEXT)',
    );
  },
  version: 1,
  );
  Future<void> insertProduct(Product prod) async {
    final db = await database;
    await db.insert(
      'prod',
      prod.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> Products() async {
    final db = await database;

    final List<Map<String, Object?>> ProductMaps = await db.query('prod');
    return [
      for (final {
            'title': title as String,
            'descript': descript as String,
            'price': price as double,
            'rating': rating as double,
            'image': image as String,
          } in ProductMaps)
        Product(title: title, descript: descript, price: price, rating: rating, image:image),
    ];
  }

  Future<void> updateDog(Product prod) async {
    final db = await database;

    await db.update(
      'prod',
      prod.toMap(),
      where: 'title = ?',
      whereArgs: [prod.title],
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static final List<Widget> _sections = [
    const LandingPage(),
    const Cartpage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eccomerce',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, 
      home: SafeArea(
        child: Scaffold(
          appBar: const Appbar(),
          body: _sections[_selectedIndex],
          bottomNavigationBar: Bottomnavigationbar(
            selectedIndex: _selectedIndex,
            onItemTap: _onItemTap,
          ),
        ),
      ),
    );
  }
}
