import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button_signin.dart';
import '../components/my_textfield.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TweenAnimationBuilder(
                  tween: Tween(
                    begin: 0.0,
                    end: 2.0,
                  ),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, _) {
                    return const SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Color(0xFF316B48),
                        strokeWidth: 10,
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // emailErrorMessage();
      } else if (e.code == 'wrong-password') {
        // passwordErrorMessage();
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            // const Image(
            //     image: AssetImage('assets/munchlax.png'),
            //     height: 150,
            //     width: 150),
            const Image(
              image: AssetImage('assets/logo-3.png'),
              height: 100,
              width: 100,
            ),
            const Text(
              'Hello,',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xFF316b48)),
            ),

            //welcome back
            const Text(
              'Welcome back!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Please Login To Access Your Account!',
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 2, 2),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            ),

            const SizedBox(
              height: 20,
            ),

            //username textfield
            MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false),

            const SizedBox(
              height: 10,
            ),

            //password textfield
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true),

            const SizedBox(
              height: 5,
            ),
            //forgot password
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color(0xFF316B48),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF21386E)),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            //sign in btn
            MyButtonSI(onTap: signUserIn),

            const SizedBox(
              height: 35,
            ),

            // (OAuth)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //google & fb sign in options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 238, 238, 238),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 1.0),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Image(
                      image: AssetImage('assets/google_logo.png'),
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 238, 238, 238),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Image(
                      image: AssetImage('assets/fb_logo.png'),
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            //register page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 79, 79, 79), fontSize: 14),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Color(0xFF316B48),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            )
          ]),
        ))));
  }
}
