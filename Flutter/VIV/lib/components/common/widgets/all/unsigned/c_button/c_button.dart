// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom Button Widget
class CButton extends StatelessWidget {
  // Callback function to be executed when the button is tapped
  final Function()? onTap;

  // Text to be displayed on the button
  final String text;

  // Constructor for the CButton widget
  const CButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    // GestureDetector widget allows detecting gestures on its child widget
    return GestureDetector(
      // Assigning the provided onTap callback to the GestureDetector's onTap property
      onTap: onTap,
      // Container widget to provide padding, margin, and decoration for the button
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        // BoxDecoration to style the button with a black background and rounded corners
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        // Centering the text within the container
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
