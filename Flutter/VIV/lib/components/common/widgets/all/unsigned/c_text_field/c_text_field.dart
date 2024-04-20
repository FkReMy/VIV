// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Importing colors from a custom colors file
import 'package:viv/components/common/colors/colors.dart';

// Custom Text Field Widget
class CTextField extends StatelessWidget {
  // Controller for the text field to manage its content
  final controller;

  // Hint text to be displayed when the text field is empty
  final String hintText;

  // Flag to determine whether the text should be obscured (e.g., for passwords)
  final bool obscureText;

  // Constructor for the CTextField widget
  const CTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    // Padding widget to provide horizontal padding for the text field
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      // TextField widget for user input with various styling options
      child: TextField(
        // Assigning the provided controller to the text field
        controller: controller,
        // Setting the obscureText property based on the provided flag
        obscureText: obscureText,
        // InputDecoration to customize the appearance of the text field
        decoration: InputDecoration(
          // Border when the text field is not focused
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          // Border when the text field is focused
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: lightgray),
          ),
          // Background color of the text field
          fillColor: lightgray,
          filled: true,
          // Hint text to be displayed when the text field is empty
          hintText: hintText,
          // Style for the hint text
          hintStyle: const TextStyle(color: darkgray),
        ),
      ),
    );
  }
}
