// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom Like Button Widget
// ignore: must_be_immutable
class CLikeButton extends StatelessWidget {
  // Property to determine whether the button is in the liked state
  final bool isLiked;

  // Callback function to be executed when the button is tapped
  void Function()? onTap;

  // Constructor for the CLikeButton widget
  CLikeButton({super.key, required this.isLiked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // GestureDetector widget allows detecting gestures on its child widget
    return GestureDetector(
      // Assigning the provided onTap callback to the GestureDetector's onTap property
      onTap: onTap,
      // Child widget is an Icon representing a heart (liked or not liked) with appropriate color
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
