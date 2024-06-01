import 'package:flutter/material.dart';

class MyButtonSU extends StatelessWidget {
  final Function()? onTap;

  const MyButtonSU({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: const Color(0xFF316B48),
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            "Sign Up ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
