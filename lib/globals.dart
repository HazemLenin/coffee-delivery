import 'package:coffee_delivery/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import './models/flavour_model.dart';
import 'dart:math';

class Globals {
  static const primaryColor = Color(0xFF201520);
  static const secondaryColor = Color(0xFFEFE3C8);
  static const redColor = Color(0xFFC94C4C);
  static const description =
      "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup";
  static List<Flavour> flavours = [
    Flavour(
      image: 'assets/images/product1.jpg',
      description: Globals.description,
      name: 'Cinnamon & Cocoa',
      price: 169,
    ),
    Flavour(
        image: 'assets/images/product2.jpg',
        description: Globals.description,
        name: "Drizzled with Caramel",
        price: 199),
    Flavour(
        image: 'assets/images/product3.jpg',
        description: Globals.description,
        name: "Bursting  Blueberry",
        price: 249),
    Flavour(
        image: 'assets/images/product4.jpg',
        description: Globals.description,
        name: "Dalgona Whipped Macha",
        price: 299),
    Flavour(
        image: 'assets/images/product5.jpg',
        description: Globals.description,
        name: "Extra Whipped Cream",
        price: 155),
    Flavour(
        image: 'assets/images/product6.jpg',
        description: Globals.description,
        name: "Vanilla Maple Syrup",
        price: 170),
  ];
  static List<String> types = [
    'Cappuccino',
    'latte',
    'Americano',
    'Espresso',
    'Flat White',
    'Macchiato'
  ];
  static List<CartItem> cartItems = [];
  static void addToCart({required Flavour flavour, required String type}) {
    final oldCartItems = Globals.cartItems.where(
      (item) => item.flavour.name == flavour.name && item.type == type,
    );
    if (oldCartItems.isEmpty) {
      CartItem newCartItem = CartItem(
        flavour: flavour,
        type: type,
      );
      Globals.cartItems.add(newCartItem);
    } else {
      oldCartItems.first.quantity++;
    }
  }

  static double angle = 5 * pi / 100; // animated menu card angle = 5 deg
}
