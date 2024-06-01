import 'package:flutter/material.dart';
import 'package:mcc_lab_23dec23/screens/under_maintenance_screen.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../models/food.dart';
import '../models/shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  //remove item from cart
  void removeFromCart(Food food, BuildContext context) {
    //get access to shop
    final shop = context.read<Shop>();

    shop.removeCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('My Cart'),
          elevation: 0,
          backgroundColor: const Color(0xFF316B48),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: ((context, index) {
                    //get food from cart
                    final Food food = value.cart[index];

                    //get food name
                    final String foodName = food.name;

                    //get food price
                    final String foodPrice = food.price;
                    //return list tile
                    return Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF316B48),
                          borderRadius: BorderRadius.circular(8)),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(foodName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(foodPrice,
                            style: TextStyle(
                              color: Colors.grey[200],
                            )),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300],
                          ),
                          onPressed: () => removeFromCart(food, context),
                        ),
                      ),
                    );
                  })),
            ),

            //pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: 'Pay Now',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UnderMaintenance()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
