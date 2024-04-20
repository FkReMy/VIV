// Importing necessary packages and dependencies
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_button/c_button.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_square_tile/c_square_tile.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_text_field/c_text_field.dart';
import 'package:viv/helpers/services/auth_service.dart';

// Register Screen Widget
class MxTRegisterScreen extends StatefulWidget {
  final Function()? onTap;

  // Constructor for MxTRegisterScreen
  const MxTRegisterScreen({super.key, this.onTap});

  @override
  State<MxTRegisterScreen> createState() => _MxTRegisterScreenState();
}

// State class for MxTRegisterScreen
class _MxTRegisterScreenState extends State<MxTRegisterScreen> {
  // Text editing controllers for email, password, and confirm password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // Method to sign up user
  void signUserUp() async {
    // Show Loading Circle
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

    // Try creating the user
    try {
      // Check if the password is confirmed
      if (passwordController.text == confirmpasswordController.text) {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // After creating the user, create a new document in Cloud Firestore called Users
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.email)
            .set({
          "username": emailController.text.split('@')[0], // Initial username
          "bio": "Enter bio...", // Initial empty bio
          // "First Name" : "",
          // "Last Name" : "",
        });
      } else {
        // Show error message, passwords don't match
        showErrorMessage("Passwords don't Match");
      }

      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Show Error Message
      showErrorMessage(e.code);

      // Pop the loading circle
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  // Show error Message
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

              const SizedBox(height: 25),

              // Make the most of your professional Business.
              const Text(
                'Make the most of your professional Business.',
                style: TextStyle(
                  color: oldgold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // Username textfield
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

              // Confirm password textfield
              CTextField(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 35),

              // Sign up button
              CButton(
                text: "Sign Up",
                onTap: signUserUp,
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

              // Have an account? Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account?',
                    style: TextStyle(color: black),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign in',
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
