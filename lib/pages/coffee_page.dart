import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../models/flavour_model.dart';

class CoffeePage extends StatefulWidget {
  String type;
  Flavour coffeFlavour;
  CoffeePage({super.key, required this.type, required this.coffeFlavour});

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  List<String> milkTypes = [
    'Oat Milk',
    'Soy Milk',
    'Almond Milk',
  ];

  int selectedMilkIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Expanded(
        child: Container(
          color: const Color(0xFF201520),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(40),
                      child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          widget.coffeFlavour.image,
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0, left: 10, bottom: 5),
                child: Text(
                  widget.type,
                  style: GoogleFonts.rosarivo(
                      fontSize: 24, color: const Color(0xFFFFFFFF)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      widget.coffeFlavour.name,
                      style: GoogleFonts.rosarivo(
                          fontSize: 16, color: const Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(
                      width: 165,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      '4.5',
                      style: GoogleFonts.rosarivo(
                          fontSize: 16, color: const Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  widget.coffeFlavour.description,
                  style: GoogleFonts.openSans(
                      fontSize: 14, color: const Color(0xFFFFFFFF)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'choice of milk',
                  style: GoogleFonts.rosarivo(
                      fontSize: 16, color: const Color(0xFFFFFFFF)),
                ),
              ),
              Expanded(
                child: ListView.builder(
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
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          'Price',
                          style: GoogleFonts.openSans(
                              fontSize: 14, color: const Color(0xFFFFFFFF)),
                        ),
                        Text(
                          widget.coffeFlavour.price.toString(),
                          style: GoogleFonts.rosarivo(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 77,
                  ),
                  Container(
                      height: 45,
                      width: 270,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10)),
                        color: Color(0xFFEFE3C8),
                      ),
                      child: TextButton(
                          onPressed: (() {}),
                          child: Text(
                            'BUY NOW',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: const Color(0xFF4A2B29)),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget itemBox({
    required String milkTypes,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              height: 40,
              width: 125,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEFE3C8)),
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(10)),
                color:
                    isSelected ? const Color(0xFFEFE3C8) : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  milkTypes,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rosarivo(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isSelected
                          ? const Color(0xFF201520)
                          : const Color(0xFFEFE3C8)),
                ),
              )),
        ],
      ),
    );
  }
}
