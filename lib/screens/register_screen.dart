// ignore_for_file: use_build_context_synchronously
//sign in credentials for demo (login, etc. username = 'matthew@gmail.com, password = matt123)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc_lab_23dec23/components/my_button.dart';
import 'package:mcc_lab_23dec23/pages/auth.dart';
import '../components/my_button_signup.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void showErrorMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
              child: Column(
                children: [
                  Text(
                    errorMessage,
                    style: const TextStyle(
                        color: Color(0xFF316B48),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  MyButton(
                    text: 'Reinput Credentials',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Auth()));
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  //sign user UP
  void signUserUp() async {
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
    if (passwordController.text == confirmpasswordController.text) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());

        //create new document of Users in firebase
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.email!)
            .set({
          'username': emailController.text.split('@')[0],
          'age': 'Empty Age...',
          'favorite food': 'Empty food...'
        });

        Navigator.pop(context);
      } on FirebaseAuthException {
        Navigator.pop(context);
        showErrorMessage("Invalid Email");
      }
    } else {
      showErrorMessage("Passwords don't match!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // const SizedBox(height: 25),
            //logo
            const Image(
                image: AssetImage('assets/logo-3.png'),
                height: 125,
                width: 125),

            //welcome back
            const Text(
              'Get Started',
              style: TextStyle(
                  color: Color(0xFF316B48),
                  fontSize: 30,
                  fontFamily: 'Pokemon',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Please Input Your Credentials!',
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 2, 2),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            ),

            const SizedBox(
              height: 50,
            ),

            //FullName Textfield
            MyTextField(
              controller: emailController,
              hintText: 'Full Name',
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              controller: confirmpasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),

            const SizedBox(
              height: 20,
            ),

            //sign up btnGestureDetector (!!NO VALIDATION YET!!)
            MyButtonSU(onTap: signUserUp),

            const SizedBox(
              height: 50,
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
                      'Or Sign In With',
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
              height: 15,
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
                            horizontal: 1.0, vertical: 1.0),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Image(
                      image: AssetImage('assets/fb_logo.png'),
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: sign, child: child)
              ],
            ),

            const SizedBox(
              height: 35,
            ),

            //register page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Have an Account?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 79, 79, 79), fontSize: 14),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login Here',
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

  // Future<UserCredential> signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
