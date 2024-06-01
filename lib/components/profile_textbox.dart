import 'package:flutter/material.dart';

class ProfileTextbox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const ProfileTextbox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.settings, color: Colors.black))
            ],
          ),
          //Profile Text name
          Text(text, style: TextStyle(color: Colors.grey[900], fontSize: 16))
        ],
      ),
    );
  }
}
