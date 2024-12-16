import 'package:ecommerce/components/Product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late Database database;
List<Product> listaProductos = [];

Future<void> initializeDatabase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'eccomerce.db'),
    onCreate: (db, version) {
      print('Creating database...');
      return db.execute(
        'CREATE TABLE Products(title TEXT PRIMARY KEY, descript TEXT, money REAL, rating REAL, image TEXT)',
      );
    },
    version: 1,
  );
  print('Database initialized');
  listaProductos = await selectProducts();
}

Future<void> insertProduct(Product prod) async {
  final db = database;
  print('Inserting product: ${prod.title}');
  await db.insert(
    'Products',
    prod.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print('Product inserted successfully');
}

Future<List<Product>> selectProducts() async {
  final db = database;
  print('Querying all products...');
  final List<Map<String, Object?>> productMaps = await db.query('Products');
  print('Found ${productMaps.length} products');
  return [
    for (final {
          'title': title as String,
          'descript': descript as String,
          'price': price as double,
          'rating': rating as double,
          'image': image as String,
        } in productMaps)
      Product(
          title: title,
          descript: descript,
          price: price,
          rating: rating,
          image: image),
  ];
}

Future<void> updateProduct(Product prod) async {
  final db = database;
  print('Updating product: ${prod.title}');
  await db.update(
    'Products',
    prod.toMap(),
    where: 'title = ?',
    whereArgs: [prod.title],
  );
  print('Product updated successfully');
}
