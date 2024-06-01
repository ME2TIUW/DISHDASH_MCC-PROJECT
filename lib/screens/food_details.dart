import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  void addToCart() {
    //access the shop
    final shop = context.read<Shop>();

    //add cart
    shop.addToCart(widget.food);

    //inform user, successfull transaction
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF316B48),
        content: const Text(
          'Added to cart!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
            color: Colors.white,
          )
        ],
      ),
    );
  }

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
                  Image(
                    image: AssetImage(widget.food.imagePath),
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
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //food recipe name
                  Text(
                    widget.food.name,
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
                    widget.food.description,
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
                  Text(
                    "\$${widget.food.price}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  //add to cart
                  MyButton(text: "Add to cart", onTap: addToCart)
                  // food recipe quantity
                  // Row(
                  //   children: [
                  //     //buttons
                  //     //minus
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //           color: Color(0xFF224b32), shape: BoxShape.circle),
                  //       child: IconButton(
                  //         icon: const Icon(
                  //           Icons.remove,
                  //           color: Colors.white,
                  //         ),
                  //         onPressed: decrementQuantity,
                  //       ),
                  //     ),
                  //     Text(
                  //       quantityCount.toString(),
                  //       style: const TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18),
                  //     ),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //           color: Color(0xFF224b32), shape: BoxShape.circle),
                  //       child: IconButton(
                  //         icon: const Icon(
                  //           Icons.add,
                  //           color: Colors.white,
                  //         ),
                  //         onPressed: incrementQuantity,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
