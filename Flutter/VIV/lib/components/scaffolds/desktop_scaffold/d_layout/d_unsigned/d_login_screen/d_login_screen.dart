// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_button/c_button.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_square_tile/c_square_tile.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_text_field/c_text_field.dart';
import 'package:viv/components/scaffolds/desktop_scaffold/d_layout/d_unsigned/d_register_screen/d_register_screen.dart';

// DLoginScreen widget for the desktop login screen
class DLoginScreen extends StatefulWidget {
  const DLoginScreen({Key? key});

  @override
  State<DLoginScreen> createState() => _DLoginScreenState();
}

class _DLoginScreenState extends State<DLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to sign in the user
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Scaffold(
          backgroundColor: black,
          body: Center(
            child: CircularProgressIndicator(
              color: oldgold,
            ),
          ),
        );
      },
    );

    try {
      // Try to sign in with provided email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // Handle different authentication exceptions
      if (e.code == 'user-not-found') {
        return wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        return wrongPasswordMessage();
      }
    }
  }

  // Display a dialog for incorrect email
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  // Display a dialog for incorrect password
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: oldgold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Text fields for email and password
                  CTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Sign In button
                  CButton(
                    text: "Sign In",
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: lightgray,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: oldgold),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: lightgray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Social media login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CSquareTile(imagePath: 'assets/images/google.png'),
                      SizedBox(width: 25),
                      CSquareTile(imagePath: 'assets/images/apple.png'),
                    ],
                  ),
                  const SizedBox(height: 50),
                  // Link to registration screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New to V I V?',
                        style: TextStyle(color: black),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DRegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Join Now',
                          style: TextStyle(
                            color: oldgold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
