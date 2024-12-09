import 'package:ecommerce/components/Appbar.dart';
import 'package:ecommerce/components/BottomNavigationBar.dart';
import 'package:ecommerce/components/Product.dart';
import 'package:ecommerce/database/BBDD.dart';
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

  await initializeDatabase();

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
