import 'menu_page.dart';
import './cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'favourites_page.dart';
import 'notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const MenuPage(),
    const CartPage(),
    const FavouritesPage(),
    const NotificationsPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      /* Because of bottom navigation bar cannot change svg opacity, active icon argument has been added to each bottom navigation bar item */
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF22151F),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: SvgPicture.asset('assets/images/Home.svg',
                  color: const Color(0xFFEFE3C8).withOpacity(.4)),
              activeIcon: SvgPicture.asset('assets/images/Home.svg'),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: SvgPicture.asset('assets/images/Cart.svg',
                  color: const Color(0xFFEFE3C8).withOpacity(.4)),
              activeIcon: SvgPicture.asset('assets/images/Cart.svg'),
            ),
            BottomNavigationBarItem(
              label: "Favourites",
              icon: SvgPicture.asset('assets/images/Heart.svg',
                  color: const Color(0xFFEFE3C8).withOpacity(.4)),
              activeIcon: SvgPicture.asset('assets/images/Heart.svg'),
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: SvgPicture.asset('assets/images/Notification.svg',
                  color: const Color(0xFFEFE3C8).withOpacity(.4)),
              activeIcon: SvgPicture.asset('assets/images/Notification.svg'),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
