import 'package:flutter/material.dart';
import 'coffee_page.dart';
import '../models/flavour_model.dart';
import '../globals.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Globals.primaryColor,
        elevation: 0,
        title: Text(
          'Menu',
          style: TextStyle(
              fontFamily: 'Rosarivo',
              fontSize: 48,
              color: Globals.secondaryColor),
        ),
      ),
      backgroundColor: Globals.primaryColor,
      body: Column(
        children: [
          // Search box
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color(0xFF171017),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                style: TextStyle(color: Globals.secondaryColor.withOpacity(.8)),
                decoration: InputDecoration(
                    hintText: 'Browse your favourite coffee...',
                    hintStyle: TextStyle(
                        fontFamily: 'Rosarivo',
                        color: Globals.secondaryColor.withOpacity(.8)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFFEFE3C8).withOpacity(0.5),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Side type selector
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFF704341).withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Globals.types.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTypeIndex = index;
                                    });
                                  },
                                  child: coffeeType(
                                      type: Globals.types[index],
                                      isSelected: index == selectedTypeIndex),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // Flavours grid
                Expanded(
                  flex: 5,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 246,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
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
                                return CoffeePage(
                                  type: Globals.types[selectedTypeIndex],
                                  coffeeFlavour: Globals.flavours[index],
                                );
                              }),
                            ),
                          );
                        },
                        onLongPress: () {
                          // Update the UI and update the required properties e.g. margin, isRotated
                          setState(() {
                            Globals.flavours[index].margin = 50;
                            Globals.flavours[index].isRotated = true;
                          });
                        },

                        // User release his finger after a long press
                        onLongPressEnd: (LongPressEndDetails details) {
                          // reset properties to defaults
                          setState(() {
                            Globals.flavours[index].margin = 0;
                            Globals.flavours[index].isRotated = false;
                          });

                          // after reset animations go to another page
                          Navigator.push(
                            context,
                            PageRouteBuilder(
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
                                return CoffeePage(
                                  type: Globals.types[selectedTypeIndex],
                                  coffeeFlavour: Globals.flavours[index],
                                );
                              }),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 135,
                                height: 230,
                                child: Image.asset("assets/images/Box.png"),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                                left: Globals.flavours[index].margin,
                                child: flavourCard(
                                    coffeeFlavour: Globals.flavours[index]),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: Globals.flavours.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget flavourCard({
    required Flavour coffeeFlavour,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          transformAlignment: Alignment.center,
          transform: Transform.rotate(
            angle: coffeeFlavour.isRotated ? Globals.angle : 0, // 5 deg
          ).transform,
          width: 135,
          height: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF4A414A)),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                        transformAlignment: Alignment.center,
                        transform: Transform.rotate(
                          angle: coffeeFlavour.isRotated
                              ? -Globals.angle
                              : 0, // -5 deg
                        ).transform,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            coffeeFlavour.image,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          width: 41,
                          height: 20,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFD3A601),
                                size: 12,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontFamily: 'Rosarivo',
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    coffeeFlavour.name,
                    style: TextStyle(
                      fontFamily: 'Rosarivo',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.08),
                        borderRadius: BorderRadius.circular(12)),
                    width: 111,
                    height: 39,
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              '₹${coffeeFlavour.price.toString()}',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            color: Globals.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Globals.addToCart(
                                  flavour: coffeeFlavour,
                                  type: Globals.types[selectedTypeIndex]);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget coffeeType({required String type, required bool isSelected}) {
    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 8, right: 9),
            child: Text(
              type,
              style: TextStyle(
                fontFamily: 'Rosarivo',
                color: isSelected
                    ? const Color(0xFFEFE3C8)
                    : const Color(0xFFEFE3C8).withOpacity(.5),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
