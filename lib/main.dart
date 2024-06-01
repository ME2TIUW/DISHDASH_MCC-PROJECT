import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/shop.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // routes: {
        //   //splashscreen
        //   // '/splashscreen': (context) => const SplashScreen(),
        //   // //menuscreen
        //   // '/menuscreen': (context) => MenuScreen(),
        // //cartscreen
        // '/cartscreen': (context) => const CartScreen(),
        //   // //add new Food
        //   // '/addfoodscreen': (context) => const AddFood(),
        //   // //bodynavigator
        //   // '/bodynavigatorscreen': (context) => const BodyNavigator(),
        // },
      ),
    );
  }
}