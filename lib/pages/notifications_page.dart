import '../globals.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(fontFamily: 'Rosarivo', fontSize: 24),
        ),
      ),
      backgroundColor: Globals.primaryColor,
      body: Center(
          child: Text(
        'No notifications yet.',
        style: TextStyle(
            fontFamily: 'Rosarivo',
            fontSize: 20,
            color: Globals.secondaryColor),
      )),
    );
  }
}
