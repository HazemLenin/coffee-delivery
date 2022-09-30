import 'package:coffee_delivery/globals.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

import '../models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final pagePadding = 18.0;
  final itemContentPadding = 12.0;
  final itemImageSize = 72.0;
  final itemBorderRadius = 15.0;
  final buttonSize = 30.0;
  final buttonBorderRadius = 8.0;
  final coffees = [
    Coffee(
      type: "Cappuccino",
      flavour: "Dalgona Macha",
      image: "assets/images/product4.jpg",
      price: 299,
    ),
    Coffee(
      type: "Cappuccino",
      flavour: "Bursting Blueberry",
      image: "assets/images/product5.jpg",
      price: 249,
    ),
    Coffee(
      type: "Cappuccino",
      flavour: "Cinnamon & Cocoa",
      image: "assets/images/product3.jpg",
      price: 299,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Cart",
          style: GoogleFonts.rosarivo(fontSize: 24),
        ),
      ),
      backgroundColor: Globals.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: Globals.cartItems.length,
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(Globals.cartItems[index]),
                onDismissed: (direction) {
                  setState(() {
                    Globals.cartItems.removeAt(index);
                  });
                },
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(itemBorderRadius),
                    color: Globals.redColor,
                  ),
                  child: const Icon(Icons.delete_outlined, color: Colors.white),
                ),
                secondaryBackground: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(itemBorderRadius),
                    color: Globals.redColor,
                  ),
                  child: const Icon(Icons.delete_outlined, color: Colors.white),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: pagePadding),
                  child: Container(
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(itemBorderRadius),
                      color: Colors.white.withOpacity(.1),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(itemContentPadding),
                          child: Container(
                            width: itemImageSize,
                            height: itemImageSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(itemBorderRadius),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                                Globals.cartItems[index].flavour.image),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(itemContentPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Globals.cartItems[index].type,
                                  style: GoogleFonts.rosario(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  Globals.cartItems[index].flavour.name,
                                  style: GoogleFonts.rosario(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  '₹${Globals.cartItems[index].flavour.price}',
                                  style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(itemContentPadding),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.08),
                              borderRadius:
                                  BorderRadius.circular(buttonBorderRadius),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Globals.cartItems[index].quantity >
                                          0) {
                                        Globals.cartItems[index].quantity--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: buttonSize,
                                    height: buttonSize,
                                    decoration: BoxDecoration(
                                      color: Globals.secondaryColor,
                                      borderRadius: BorderRadius.circular(
                                          buttonBorderRadius),
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    Globals.cartItems[index].quantity
                                        .toString(),
                                    style: GoogleFonts.rosarivo(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Globals.cartItems[index].quantity++;
                                    });
                                  },
                                  child: Container(
                                    width: buttonSize,
                                    height: buttonSize,
                                    decoration: BoxDecoration(
                                      color: Globals.secondaryColor,
                                      borderRadius: BorderRadius.circular(
                                          buttonBorderRadius),
                                    ),
                                    // ignore: prefer_const_constructors
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              children: [
                // First dotted line
                Container(
                  width: double.infinity,
                  decoration: DottedDecoration(
                    color: Colors.white.withOpacity(.2),
                    strokeWidth: 1,
                  ),
                ),
                // Cost Details
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charges",
                            style: GoogleFonts.rosarivo(color: Colors.white),
                          ),
                          Text(
                            "₹49",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taxes",
                            style: GoogleFonts.rosarivo(color: Colors.white),
                          ),
                          Text(
                            "₹64.87",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Second dotted line
                Container(
                  width: double.infinity,
                  decoration: DottedDecoration(
                    color: Colors.white.withOpacity(.2),
                    strokeWidth: 1,
                  ),
                ),
                // Total cost
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Grand Total",
                        style: GoogleFonts.rosarivo(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "₹1009.87",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Pay button
                MaterialButton(
                  onPressed: () {
                    print("Pay");
                  },
                  color: Globals.secondaryColor,
                  minWidth: double.infinity,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    "PAY NOW",
                    style: GoogleFonts.openSans(
                      color: Globals.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
