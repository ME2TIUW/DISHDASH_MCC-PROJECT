import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/body_navigator.dart';

class MyButtonNext extends StatelessWidget {
  final Function()? onTap;
  final User? currentUser;
  const MyButtonNext(
      {super.key, required this.onTap, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BodyNavigator(
                currentUser: currentUser,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: const Color(0xFF316B48),
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            "Next >",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
