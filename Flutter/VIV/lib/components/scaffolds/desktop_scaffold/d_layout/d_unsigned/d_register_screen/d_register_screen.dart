// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_button/c_button.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_square_tile/c_square_tile.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_text_field/c_text_field.dart';
import 'package:viv/components/scaffolds/desktop_scaffold/d_layout/d_unsigned/d_login_screen/d_login_screen.dart';
import 'package:viv/components/scaffolds/desktop_scaffold/desktop_scaffold.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/mobile_scaffold.dart';
import 'package:viv/components/scaffolds/tablet_scaffold/tablet_scaffold.dart';
import 'package:viv/helpers/responsive/responsive_layout.dart';

// DRegisterScreen widget for the desktop registration screen
class DRegisterScreen extends StatefulWidget {
  const DRegisterScreen({Key? key});

  @override
  State<DRegisterScreen> createState() => _DRegisterScreenState();
}

class _DRegisterScreenState extends State<DRegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // Method to sign up the user
  void signUserUp() async {
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
      // Check if the passwords match
      if (passwordController.text == confirmpasswordController.text) {
        // Try to create a new user with provided email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }
      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // Handle different authentication exceptions
      if (e.code == 'weak-password') {
        return weakPasswordMessage();
      } else if (e.code == 'email-already-in-use') {
        return usedEmailMessage();
      }
    } catch (e) {
      print(e);
    }

    // Navigate to the main screen after successful registration
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold(),
        ),
      ),
    );
  }

  // Display a dialog for used email
  void usedEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('The account already exists for that email.'),
        );
      },
    );
  }

  // Display a dialog for weak password
  void weakPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('The password provided is too weak.'),
        );
      },
    );
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
                    'Make the most of your professional Business',
                    style: TextStyle(
                      color: oldgold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Text fields for email, password, and confirm password
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
                  CTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  // Sign Up button
                  CButton(
                    text: "Sign Up",
                    onTap: signUserUp,
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
                  // Link to login screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(color: black),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DLoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign in',
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
