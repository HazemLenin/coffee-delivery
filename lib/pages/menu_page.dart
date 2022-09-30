import 'package:coffee_delivery/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style:
              GoogleFonts.rosarivo(fontSize: 48, color: Globals.secondaryColor),
        ),
      ),
      body: Container(
        color: Globals.primaryColor,
        child: Column(
          children: [
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
                  decoration: InputDecoration(
                      hintText: 'Browse your favourite coffee...',
                      hintStyle: GoogleFonts.rosarivo(
                          color: Globals.secondaryColor.withOpacity(.8)),
                      labelStyle: GoogleFonts.rosarivo(
                          color: const Color(0xFFEFE3C8).withOpacity(0.5)),
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
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>projecto(item: classo.items[index],)));
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
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 246,
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
                                      coffeFlavour: Globals.flavours[index],
                                    );
                                  }),
                                ),
                              );
                            },
                            onLongPress: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 25,
                                top: 8,
                              ),
                              child: Stack(children: [
                                Container(
                                    width: 135,
                                    height: 230,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1D111D)
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(12.6),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 2),
                                            blurRadius: 3.0,
                                            color: const Color(0xFF171017)
                                                .withOpacity(0.4),
                                          )
                                        ])),
                                Column(
                                  children: [
                                    itembox(
                                        coffeFlavour: Globals.flavours[index])
                                  ],
                                ),
                              ]),
                            ));
                      },
                      itemCount: Globals.flavours.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itembox({
    required Flavour coffeFlavour,
  }) {
    return Container(
        width: 135,
        height: 230,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF4A414A)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 111,
                height: 111,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Center(child: Image.asset(coffeFlavour.image)),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
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
                                style: GoogleFonts.rosarivo(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                coffeFlavour.name,
                style: GoogleFonts.rosarivo(color: Colors.white, fontSize: 14),
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
                          '₹${coffeFlavour.price.toString()}',
                          style: GoogleFonts.openSans(
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
                          final oldCartItems = Globals.cartItems.where(
                            (item) =>
                                item.flavour.name == coffeFlavour.name &&
                                item.type == Globals.types[selectedTypeIndex],
                          );
                          if (oldCartItems.isEmpty) {
                            CartItem newCartItem = CartItem(
                              flavour: coffeFlavour,
                              type: Globals.types[selectedTypeIndex],
                            );
                            Globals.cartItems.add(newCartItem);
                          } else {
                            oldCartItems.first.quantity++;
                          }
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
        ));
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
              style: GoogleFonts.rosarivo(
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
