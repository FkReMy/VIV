// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom Comment Button Widget
// ignore: must_be_immutable
class CCommentButton extends StatelessWidget {

  // Callback function to be executed when the button is tapped
  void Function()? onTap;

  // Constructor for the CCommentButton widget
  CCommentButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // GestureDetector widget allows detecting gestures on its child widget
    return GestureDetector(
      // Assigning the provided onTap callback to the GestureDetector's onTap property
      onTap: onTap,
      // Child widget is an Icon representing a comment with a grey color
      child: const Icon(
        Icons.comment_outlined,
        color: Colors.grey,
      ),
    );
  }
}
