class Flavour {
  String name;
  int price;
  String image;
  String description;

  // Animated card properties
  double margin = 0;
  bool isRotated = false;

  Flavour({
    required this.image,
    required this.description,
    required this.name,
    required this.price,
  });
}
