import 'flavour_model.dart';

class CartItem {
  Flavour flavour;
  String type;
  int quantity;

  CartItem({
    required this.flavour,
    required this.type,
    this.quantity = 1,
  });
}
