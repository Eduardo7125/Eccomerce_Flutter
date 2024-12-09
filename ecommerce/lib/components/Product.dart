class Product {
  String title;
  String descript;
  double price;
  double rating;
  String image;


  Product({
    required this.title,
    required this.descript,
    required this.price,
    required this.rating,
    required this.image,
});

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'descript': descript,
      'money' : price,
      'rating' : rating,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Product{title: $title, descript: $descript, price: $price, rating: $rating, image: $image}';
  }
}