// Importing necessary packages and dependencies
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viv/components/Common/Colors/Colors.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_button/c_button.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_square_tile/c_square_tile.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_text_field/c_text_field.dart';
import 'package:viv/helpers/services/auth_service.dart';

// Login Screen Widget
class MxTLoginScreen extends StatefulWidget {
  final Function()? onTap;

  // Constructor for MxTLoginScreen
  const MxTLoginScreen({super.key, required this.onTap});

  @override
  State<MxTLoginScreen> createState() => _MxTLoginScreenState();
}

// State class for MxTLoginScreen
class _MxTLoginScreenState extends State<MxTLoginScreen> {
  // Text editing controllers for email and password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to sign in user
  void signUserIn() async {
    // Show loading circle
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
      // Try signing in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Show error message
      showErrorMessage(e.code);
    }
  }

  // Method to show error message
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  message,
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Logo
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border:
                      Border(bottom: BorderSide(width: 1.0, color: black))),
                  child: Image.asset("assets/images/vivb.png"),
                ),
              ),

              // Welcome back, you've been missed!
              const SizedBox(height: 25),
              const Text(
                '''Welcome back you've been missed!''',
                style: TextStyle(
                  color: oldgold,
                  fontSize: 16,
                ),
              ),

              // Username textfield
              const SizedBox(height: 25),
              CTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              // Password textfield
              CTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              // Forgot password?
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

              // Sign in button
              CButton(
                text: "Sign In",
                onTap: signUserIn,
              ),
              const SizedBox(height: 50),

              // Or continue with
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

              // Google sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CSquareTile(
                    imagePath: 'assets/images/google.png',
                    onTap: () => AuthService().signInwithGoogle(),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Not a member? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to V I V?',
                    style: TextStyle(color: black),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Join Now',
                      style: TextStyle(
                        color: oldgold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
