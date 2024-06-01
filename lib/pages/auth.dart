import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/welcome_home_screen.dart';
import 'login_register.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in
            if (snapshot.hasData) {
              return WelcomeHome(currentUser: snapshot.data!);
            } else {
              //toggle between pages
              return const LoginRegister();
            }
          }),
    );
  }
}
