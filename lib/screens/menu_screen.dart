import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcc_lab_23dec23/screens/add_food_screen.dart';
import 'package:mcc_lab_23dec23/screens/cart_screen.dart';
import 'package:mcc_lab_23dec23/screens/new_arrival.dart';
import 'package:mcc_lab_23dec23/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';
import '../models/shop.dart';
import '../pages/auth.dart';
import 'food_details.dart';

class MenuScreen extends StatefulWidget {
  final User? currentUser;
  const MenuScreen({super.key, required this.currentUser});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  //recipe detail page (food tile navigation)
  void recipeNav(int index) {
    //get the menu from shop file
    final shop = Provider.of<Shop>(context, listen: false);
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => FoodDetailsPage(
                  food: foodMenu[index],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = widget.currentUser;
    String? username = currentUser?.email?.split('@').first;
    username = (username!.substring(0, 1).toUpperCase() +
        username.substring(1).toLowerCase());

    void signUserOut() {
      FirebaseAuth.instance.signOut();
    }

    @override
    void initState() {
      super.initState();
      currentUser = widget.currentUser;
    }

    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

    //get the menu from shop file
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                  color: Color(0xFF316b48),
                ),
                Text(
                  'Hello, $username${'!'}',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF316b48),
                      fontFamily: 'Poppins'),
                ),
              ],
            )),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                currentUser: currentUser,
                              )));
                  signUserOut();
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xFF316b48),
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF316b48),
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      width: 138,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF316b48),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xFF316b48),
            ),
            const SizedBox(
              height: 7,
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                  signUserOut();
                },
                child: const Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Color(0xFF316b48),
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'My Cart ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF316b48),
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      width: 111,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF316b48),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color(0xFF316b48),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              title: GestureDetector(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Auth()));
                    signUserOut();
                  },
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 9,
                      ),
                      Icon(
                        Icons.logout,
                        color: Color(0xFF316b48),
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF316b48),
                            fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: const Image(
                      image: AssetImage('assets/fries_icon_menu.png'),
                      height: 50,
                      width: 50,
                      color: Color(0xFF316B48),
                    ),
                  ),
                ),
                const Text(
                  'Explore',
                  style: TextStyle(
                      color: Color(0xFF316B48),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Auth()));
                      signUserOut();
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Color(0xFF316b48),
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 45, left: 30),
                  child: Text(
                    "Food Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddFood(currentUser: currentUser)));
                    },
                    child: const Text(
                      "Add new Food",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF316B48),
                          fontSize: 16,
                          height: 2,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foodMenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => recipeNav(index),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'New Arrival',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 30),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //new arrival recipes
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewArrival()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //recipe image
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/salmon_eggs.png'),
                          height: 60,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //recipe name
                            Text(
                              'Salmon Eggs ',
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //mock price (ganti ke yang lain nanti)
                            Text(
                              '\$21.00',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
