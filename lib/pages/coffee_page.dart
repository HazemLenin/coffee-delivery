import '../globals.dart';
import './cart_page.dart';
import 'package:flutter/material.dart';

import '../models/flavour_model.dart';

class CoffeePage extends StatefulWidget {
  String type;
  Flavour coffeeFlavour;
  CoffeePage({super.key, required this.type, required this.coffeeFlavour});

  @override
  State<CoffeePage> createState() => _CoffeePageState(
      flavour: this.coffeeFlavour,
      type: this.type); // Pass flavour and type to the widget state
}

class _CoffeePageState extends State<CoffeePage> {
  Flavour flavour;
  String type;
  _CoffeePageState({
    required this.flavour,
    required this.type,
  });

  List<String> milkTypes = [
    'Oat Milk',
    'Soy Milk',
    'Almond Milk',
  ];

  int selectedMilkIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(40),
                  child: Container(
                    color: Colors.black,
                    child: Image.asset(
                      widget.coffeeFlavour.image,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFF201520),
                          borderRadius: BorderRadius.circular(70)),
                      child: IconButton(
                        padding: const EdgeInsets.all(8.0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Type
            Padding(
              padding: const EdgeInsets.only(top: 13.0, bottom: 5),
              child: Text(
                widget.type,
                style: TextStyle(
                    fontFamily: 'Rosarivo', fontSize: 24, color: Colors.white),
              ),
            ),

            // Coffee flavour and rate
            Row(
              children: [
                Text(
                  widget.coffeeFlavour.name,
                  style: TextStyle(
                      fontFamily: 'Rosarivo',
                      fontSize: 16,
                      color: Colors.white),
                ),

                // Empty space because main axis alignment space between will seperate the star from the rating
                Expanded(
                  child: Container(),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '4.5',
                  style: TextStyle(
                      fontFamily: 'Rosarivo',
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),

            // Description
            Text(
              widget.coffeeFlavour.description,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Milk selection
            Text(
              'choice of milk',
              style: TextStyle(
                fontFamily: 'Rosarivo',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 8.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMilkIndex = index;
                        });
                      },
                      child: itemBox(
                        isSelected: index == selectedMilkIndex,
                        milkTypes: milkTypes[index],
                      ),
                    );
                  },
                  itemCount: milkTypes.length,
                ),
              ),
            ),

            // Price and buy now button
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      '₹${widget.coffeeFlavour.price.toString()}',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Globals.addToCart(flavour: this.flavour, type: this.type);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secanimation,
                              Widget child) {
                            return ScaleTransition(
                                alignment: Alignment.centerRight,
                                scale: animation,
                                child: child);
                          },
                          pageBuilder: ((BuildContext context,
                              Animation<double> animation,
                              Animation<double> secanimation) {
                            return CartPage();
                          }),
                        ),
                      );
                    },
                    height: 45,
                    color: Globals.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xFF4A2B29)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBox({
    required String milkTypes,
    required bool isSelected,
  }) {
    return Container(
        height: 40,
        width: 125,
        decoration: BoxDecoration(
          border: Border.all(color: Globals.secondaryColor),
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
          color: isSelected ? Globals.secondaryColor : Colors.transparent,
        ),
        child: Center(
          child: Text(
            milkTypes,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosarivo',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color:
                    isSelected ? Globals.primaryColor : Globals.secondaryColor),
          ),
        ));
  }
}
