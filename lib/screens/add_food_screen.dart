import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc_lab_23dec23/screens/body_navigator.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/shop.dart';

class AddFood extends StatefulWidget {
  final User? currentUser;
  const AddFood({super.key, required this.currentUser});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final foodNameController = TextEditingController();
  final foodPriceController = TextEditingController();
  final foodImageController = TextEditingController();
  final foodRatingController = TextEditingController();
  final foodDescriptionController = TextEditingController();

  Food newFood = Food(
      name: "",
      price: "XX.XX",
      imagePath: "assets/new_food.png",
      rating: "X.X",
      description: "asdasd");

  void addFood() {
    String foodName = foodNameController.text.trim();
    String foodPrice = foodPriceController.text.trim();
    String foodImage = foodImageController.text.trim();
    String foodRating = foodRatingController.text.trim();
    String foodDescription = foodDescriptionController.text.trim();

    newFood = Food(
        name: foodName,
        price: foodPrice,
        imagePath: foodImage,
        rating: foodRating,
        description: foodDescription);

    //access the shop
    Shop shop = Provider.of<Shop>(context, listen: false);

    //add food
    shop.addFood(newFood);

    //inform user, successfull transaction
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF316B48),
        content: const Text(
          'Added to Menu!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BodyNavigator(
                            currentUser: widget.currentUser,
                          )));
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
        centerTitle: true,
        title: const Text(
          'Add Food',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF316B48)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Food Name',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316B48)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: foodNameController,
                decoration: const InputDecoration(
                  labelText: 'Insert Food Name here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Food Price',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316B48)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: foodPriceController,
                decoration: const InputDecoration(
                  labelText: 'Insert Food Price here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Food Image Path',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316B48)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: foodImageController,
                decoration: const InputDecoration(
                  labelText: 'Insert Food Image Path here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Food Rating',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316B48)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: foodRatingController,
                decoration: const InputDecoration(
                  labelText: 'Insert Food Rating here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Food Description',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316B48)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: foodDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Insert Food Rating here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: addFood,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(500, 55),
                  backgroundColor: const Color(0xFF316B48),
                ),
                child: const Text(
                  'Add Food',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
