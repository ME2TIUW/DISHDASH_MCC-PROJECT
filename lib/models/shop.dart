import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: "Bibimbap",
        price: "80.00",
        imagePath: "assets/bibimbap.png",
        rating: "5.0",
        description:
            "Experience the vibrant flavors of Korea with our Bibimbap. A colorful bowl of rice topped with assorted vegetables, marinated beef, a fried egg, and spicy gochujang sauce. A harmonious blend of textures and tastes in every bite.\n\nIngredients:\n-Cooked rice\n-Thinly sliced beef\n-Assorted vegetables (spinach, carrots, bean sprouts, mushrooms)\n-Eggs\n-Gochujang (Korean red chili paste)\n-Soy sauce\n-Sesame oil\n\n-Preparation Time: 30 minutes\n\nSteps:\n1.Marinate the beef slices with soy sauce, sesame oil, and a pinch of sugar for 10-15 minutes.\n2.Prepare the vegetables by blanching or sautéing them separately until tender-crisp.\n3.Fry the eggs sunny-side-up or as desired.\n4.Assemble the bowl: place rice at the bottom, arrange the vegetables, beef, and egg on top.\n5.Drizzle with gochujang sauce according to taste.\n6.Mix everything together before enjoying this delightful Korean dish!"),
    Food(
        name: "Hot Dog",
        price: "75.00",
        imagePath: "assets/hotdog.png",
        rating: "4.7",
        description:
            "Indulge in the classic American delight with our mouthwatering hot dogs. Perfectly grilled sausages nestled in soft buns, topped with your favorite condiments, promising a savory treat for any occasion.\n\nIngredients:\n-Hot dog sausages\n-Hot dog buns\n-Mustard\n-Ketchup\n-Relish\n-Optional toppings: onions, sauerkraut, cheese\n-Preparation Time: 10 minutes\n\nSteps:\n1.Heat the grill or a skillet on medium-high heat.\n2.Cook the sausages until browned and fully cooked, about 5-7 minutes.\n3.Toast the hot dog buns on the grill or in a toaster for a minute or \n4.until slightly crispy.\n5.Place the cooked sausage in the bun and add desired condiments and toppings.\n6.Serve hot and enjoy!"),
    Food(
        name: "Vietnamese Spring Rolls",
        price: "60.00",
        imagePath: "assets/spring_rolls.png",
        rating: "4.8",
        description:
            "Savor the fresh flavors of Vietnam with our Vietnamese Spring Rolls. Delicate rice paper wrapped around a medley of fresh vegetables, herbs, rice vermicelli, and your choice of protein, offering a delightful crunch in every bite.\n\nIngredients:\nRice paper wrappers\nRice vermicelli\nLettuce leaves\nFresh herbs (mint, cilantro, Thai basil)\nCarrots, julienned\nCucumber, julienned\nCooked shrimp or tofu (optional)\nHoisin or peanut dipping sauce\nPreparation Time: 20 minutes\n\nSteps:\n1.Prepare the rice vermicelli according to package instructions, drain, and set aside to cool.\n2.Soften rice paper wrappers by dipping them in warm water for a few seconds until pliable.\n3.Lay the softened wrapper flat and add a lettuce leaf, herbs, vegetables, and protein in the center.Fold the sides inward and roll tightly to enclose the filling, similar to a burrito.\n4.Serve with hoisin or peanut dipping sauce and enjoy these delightful Vietnamese spring rolls!"),
  ];

//Customer cart
  List<Food> _cart = [];

//getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

//add new food menu
  void addFood(Food foodItem) {
    _foodMenu.add(foodItem);
    notifyListeners();
  }

//remove new food menu
  void removeFood(Food foodItem) {
    _foodMenu.remove(foodItem);
    notifyListeners();
  }

//add to cart
  void addToCart(Food foodItem) {
    // for (int i = 0; i < quantity; i++) {
    _cart.add(foodItem);
    // }
    notifyListeners();
  }

//remove to cart
  void removeCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
