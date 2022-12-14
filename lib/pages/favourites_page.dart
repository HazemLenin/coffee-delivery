import 'package:coffee_delivery/globals.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Favourites",
          style: TextStyle(fontFamily: 'Rosarivo', fontSize: 24),
        ),
      ),
      backgroundColor: Globals.primaryColor,
      body: Center(
          child: Text(
        'No favourite coffee yet.',
        style: TextStyle(
            fontFamily: 'Rosarivo',
            fontSize: 20,
            color: Globals.secondaryColor),
      )),
    );
  }
}
