import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final void Function()? onTap;
  final Food food;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(left: 25.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //food image
            Image(
              image: AssetImage(food.imagePath),
              height: 140,
            ),

            //food name
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),

            //food price
            SizedBox(
              width: 160,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),

                    //food rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[900],
                        ),
                        Text(food.rating,
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
