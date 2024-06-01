import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_button.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview recipe details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const Image(
                    image: AssetImage('assets/salmon_eggs.png'),
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //recipe rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.9',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //food recipe name
                  Text(
                    'Salmon Eggs',
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 25),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Artfully arranged atop a mound of expertly seasoned sushi rice, our salmon eggs sushi presents an exquisite mosaic of delicate ikura. Each glistening orb bursts with a briny essence, releasing a tidal wave of oceanic flavors with a tantalizing pop. Balanced atop tender rice, this sushi creation promises a symphony of textures and an indulgence in the pure essence of the sea, adorned with a subtle brush of wasabi for a harmonious finish.',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 18, height: 2),
                  ),

                  // MyButton(text: 'Delete Food', onTap: removeFood)
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF316B48),
            padding: const EdgeInsets.all(25),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$35.00",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  //add to cart
                  MyButton(text: "Coming Soon", onTap: () {})
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
