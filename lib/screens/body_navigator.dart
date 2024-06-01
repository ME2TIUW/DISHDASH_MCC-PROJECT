import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc_lab_23dec23/screens/cart_screen.dart';
import 'package:mcc_lab_23dec23/screens/profile_screen.dart';
import 'menu_screen.dart';

class BodyNavigator extends StatefulWidget {
  final User? currentUser;
  const BodyNavigator({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<BodyNavigator> createState() => _BodyNavigatorState();
}

class _BodyNavigatorState extends State<BodyNavigator> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    User? currentUser = widget.currentUser;

    final List<Widget> screens = [
      const CartScreen(),
      MenuScreen(currentUser: currentUser),
      ProfileScreen(currentUser: currentUser),
    ];

    final List<Widget> items = [
      const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        child: Image(
          image: AssetImage('assets/chef-hat.png'),
          height: 75,
          width: 75,
        ),
      ),
      const Icon(
        Icons.person_2_outlined,
        color: Colors.white,
      )
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF316B48),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) => setState(() {
          this.index = index;
        }),
        items: items,
        index: index,
      ),
    );
  }
}
