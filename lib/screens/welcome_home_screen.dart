import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button_next.dart';

class WelcomeHome extends StatefulWidget {
  final User? currentUser;
  const WelcomeHome({super.key, required this.currentUser});

  @override
  State<WelcomeHome> createState() => _WelcomeHomeState();
}

class _WelcomeHomeState extends State<WelcomeHome> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void userNext() {}

  @override
  Widget build(BuildContext context) {
    User? currentUser = widget.currentUser;
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Color(0xFF316b48),
                ),
                Text(
                  'User_Name',
                  style: TextStyle(
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
                          builder: (context) => WelcomeHome(
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
                          builder: (context) => WelcomeHome(
                                currentUser: currentUser,
                              )));
                  signUserOut();
                },
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage('assets/chef-hat.png'),
                      height: 40,
                      width: 40,
                      color: Color(0xff316b48),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'My Food',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF316b48),
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      width: 117,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF316b48),
                    ),
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
                          builder: (context) => WelcomeHome(
                                currentUser: currentUser,
                              )));
                  signUserOut();
                },
                child: const Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF316b48),
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Settings ',
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
              height: 80,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeHome(
                                  currentUser: currentUser,
                                )));
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
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Home',
                style: TextStyle(
                    color: Color(0xFF316B48),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              ),
              const SizedBox(
                height: 55,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: const Image(
                  image: AssetImage(
                    'assets/food_welcome_home.jpg',
                  ),
                  width: 375,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 18.0, 0.0, 0.0),
                child: Text(
                  'Currently, The Next Part of Home Activity & Fragmentation is under development. The upcoming Part Will Be Coming Soon!',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Roboto', fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              MyButtonNext(
                onTap: userNext,
                currentUser: currentUser,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
