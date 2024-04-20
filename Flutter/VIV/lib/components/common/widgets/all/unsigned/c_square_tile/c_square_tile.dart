// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom Square Tile Widget
class CSquareTile extends StatelessWidget {
  // Callback function to be executed when the tile is tapped
  final Function()? onTap;

  // Image path for the asset to be displayed in the tile
  final String imagePath;

  // Constructor for the CSquareTile widget
  const CSquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector widget allows detecting gestures on its child widget
    return GestureDetector(
      // Assigning the provided onTap callback to the GestureDetector's onTap property
      onTap: onTap,
      // Container widget to provide padding, decoration, and a child image for the tile
      child: Container(
        padding: const EdgeInsets.all(20),
        // BoxDecoration to style the tile with a white border, rounded corners, and grey background
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        // Image.asset widget to display the image from the provided asset path with a fixed height
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
